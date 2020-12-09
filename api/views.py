# Django imports
from django.shortcuts import render
from django.db.models import Func, F, Avg, FloatField
from django.db.models.functions import Cast, Round
# REST imports
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.generics import GenericAPIView
# local imports
from api.models import (
    Customers,
    Prices,
    Ports,
)
from api.serializers import (
    MyPricesSerializer,
    ComparePricesSerializer
)
from api.utils import (
    get_error_message,
    exchange_rates,
    custom_sql,
    get_model_obj,
)



@api_view(['GET'])
def my_prices(request, day, customer):
    '''
    API endpoint that calculates average,
    absolute_diff, percent_diff, along with
    origin_code, price, destination_code

    Parameters:
        day (date)      : Input day
        customer (date) : Customer name

    Returns:
        list: Calculates average, absolute_diff, percent_diff, along with
              origin_code, price, destination_code
    '''

    # converting data into dictionary format to serialiser
    data = {"day":day, "customer":customer}
    # serializer
    serializer = MyPricesSerializer(data=data)

    # if serialiser not valid
    if not serializer.is_valid():
        # return error message
        return get_error_message("DATA_ERROR", str(serializer.errors))
    else:
        day         = serializer.data['day']
        customer    = serializer.data['customer']

    # filter by day
    day_prices_obj = Prices.objects.filter(day=day)
    # filter by customer
    customer_prices_obj = day_prices_obj.filter(customer__customer=customer)
    # fint the average
    average_price = day_prices_obj.filter(
        orig_code__in=customer_prices_obj.values_list('orig_code', flat=True),
        dest_code__in=customer_prices_obj.values_list('dest_code', flat=True)
    ).aggregate(average_price=Round(Avg('price'))).get('average_price', 0.00)
    # find the absoluteand percent difference
    diff_obj_list = customer_prices_obj.annotate(
        absolute_diff=Cast(
            Func(F('price') - average_price, function='ABS'), FloatField()
        ),
    ).annotate(
        percent_diff=(F('absolute_diff')/average_price) * 100,
    ).values(
        'absolute_diff',
        'percent_diff',
        'price',
        origin_code=F('orig_code__code'),
        destination_code=F('dest_code__code'),
    )

    # insert avarage price in result_set
    result_set = [{**each, 'average': average_price}  for each in diff_obj_list]
    # response structure
    success = [{
                "status": "success",
                "data": result_set
                }]
    # returns response
    return Response(success, status=status.HTTP_200_OK)



class ComparePriceViewSet(GenericAPIView):
    """
    API endpoint upload a price convert into USD,
    save it into database and compare with average,
    absolute_diff and percent_diff

    Parameters:
        day (date)              : Input day
        price (int)             : Input prices
        currency (str)          : Currency type
        origin_code (str)       : Origin port code
        destination_code (str)  : Destination port code

    Returns:
        list: calculated average, absolute_diff and percent_diff
    """

    queryset = ''
    serializer_class = ComparePricesSerializer

    def post(self, request, *args, **kwargs):

        # obtain the data
        data = request.data
        # check data with serializer
        serializer = ComparePricesSerializer(data=data)

        # if serialiser not valid
        if not serializer.is_valid():
            # return error message
            return get_error_message("DATA_ERROR", str(serializer.errors))
        else:
            # inputs from API
            day                 = serializer.data['day']
            price               = serializer.data['price']
            currency            = serializer.data['currency']
            origin_code         = serializer.data['origin_code']
            destination_code    = serializer.data['destination_code']

        # convert price into USD
        price = exchange_rates(price, currency)
        # get the port obj for the port code
        orig_port_obj = get_model_obj(Ports, code=origin_code)
        dest_code_obj = get_model_obj(Ports, code=destination_code)

        if not (orig_port_obj or dest_code_obj):
            content = {'message': 'origin_code/dest_code_obj not found in Ports list'}
            return Response(content, status=status.HTTP_400_BAD_REQUEST)

        try:
            prices_obj = Prices()
            prices_obj.orig_code = orig_port_obj
            prices_obj.dest_code = dest_code_obj
            prices_obj.day = day
            prices_obj.price = price
            prices_obj.save()
        except:
            # response messages
            content = {'message': 'Failed to save data'}
            return Response(content, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

        # sql queryt to find average
        avg_sql_query = """
                    SELECT AVG(prices.price)
                    FROM api_prices AS prices
                    INNER JOIN api_ports AS P1 ON ( prices.orig_code_id = P1.id )
                    INNER JOIN api_ports AS P2 ON ( prices.dest_code_id = P2.id )
                    WHERE (
                        prices.day = %s
                        AND P1.code = %s
                        AND P2.code = %s
                        )
                    """
        # inputs for sql query
        sql_inputs = (day, origin_code, destination_code)
        # execute and get data
        row = custom_sql(avg_sql_query, sql_inputs)
        # average price
        average_price = row[0]
        # initialize absolute_diff variable
        absolute_diff = None
        # initialize percent_diff variable
        percent_diff = None
        # if average price not none
        if average_price:
            # extract the average from tuple
            average_price = float(row[0])
            # find absolute value of (price-average_price)
            absolute_diff = abs(price - average_price)
            # find percent difference
            percent_diff = (absolute_diff/average_price) * 100

        # response
        success = [{
                    "status": "success",
                    "data": {
                        "average": average_price,
                        "absolute_diff": absolute_diff,
                        "percent_diff": percent_diff
                    },
                   }]

        return Response(success, status=status.HTTP_200_OK)
