"""
Serializers defined for Api app
"""
# REST imports
from rest_framework import serializers
# local imports
from api.models import Prices, Ports
from api.utils import get_model_obj, exchange_rates


class MyPricesSerializer(serializers.Serializer):
    """
    Serializer serializes day, customer
    """
    day      = serializers.DateField()
    customer = serializers.CharField()

    class Meta:
        model = Prices
        fields = ('day', 'customer')


class ComparePricesSerializer(serializers.Serializer):
    """
    Serializer serializes day, price,currency, origin_code, destination_code
    """
    day                 = serializers.DateField()
    price               = serializers.FloatField()
    currency            = serializers.CharField(max_length=5)
    origin_code         = serializers.CharField(max_length=5)
    destination_code    = serializers.CharField(max_length=5)

    class Meta:
        model = Prices
        fields = ('day', 'price', 'currency', 'origin_code', 'destination_code')


    def validate(self, data):
        """
        Validate the input data
        """
        # get the port obj for the port code
        orig_port_obj = get_model_obj(Ports, code=data['origin_code'])
        dest_code_obj = get_model_obj(Ports, code=data['destination_code'])

        # if key not foud int portlist
        if not orig_port_obj:
            message = 'origin_code not found in Ports list'
            raise serializers.ValidationError(message)
        # if key not foud int portlist
        if not dest_code_obj:
            message = 'destination_code not found in Ports list'
            raise serializers.ValidationError(message)

        try:
            # convert price into USD
            price = exchange_rates(data['price'], data['currency'])
        except Exception as error:
            message = 'currency code cannot be found'
            raise serializers.ValidationError(message)

        return data


    def create(self, validated_data):
        """
        create object with input fields to save data to model
        """
        # get the port obj for the port code
        orig_port_obj = get_model_obj(Ports, code=validated_data['origin_code'])
        dest_code_obj = get_model_obj(Ports, code=validated_data['destination_code'])

        # create Prices object
        prices_obj = Prices.objects.create(
            day=validated_data['day'],
            price=validated_data['price'],
            orig_code=orig_port_obj,
            dest_code=dest_code_obj,

        )

        return prices_obj
