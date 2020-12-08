"""
Utility functions for Api app
"""
# Other imports
import json
import requests
# Django imports
from django.conf import settings
# REST imports
from rest_framework import status
from rest_framework.response import Response

# Configuration of exchange rate API
exchange_rates_url  = settings.EXCHANGE_RATES_URL
exchange_app_id     = settings.EXCHANGE_APP_ID



def get_model_obj(model_name, **kwargs):
    """
    Gets the first model obj from model_name
    """
    model_obj = model_name.objects.filter(**kwargs).first()

    return model_obj


def custom_sql(sql_query, sql_inputs):
    '''
    Executes sql_query allong with sql_inputs

    Parameters:
        sql_query (str)     : The sql_query
        sql_inputs (tuple)  : The inputs for the sql_query

    Returns:
        tuple: First row of result set
    '''
    from django.db import connection
    # connecting to database
    with connection.cursor() as cursor:
        # execute query along with inputs
        cursor.execute(sql_query, sql_inputs)
        # fetch the row
        row = cursor.fetchone()
    # return the row
    return row



def exchange_rates(price, currency_code):
    '''
    Convert price into USD

    Parameters:
        price (int)        : The price to convert
        currency_code (str) : The currency of the input price

    Returns:
        float: USD converted price
    '''
    # parameters to GET
    PARAMS = {'app_id':exchange_app_id}
    # base url
    URL = exchange_rates_url
    # GET request
    r = requests.get(url = URL, params = PARAMS)
    # extracting data in json format
    data = r.json()
    # USD rate of corresponding currency
    USD_rate = data['rates'][currency_code.upper()]
    # convert price into USD
    usd_price = price/USD_rate
    # return usd_price
    return usd_price



def get_error_message(error_type, message, status_code=None):
    '''
    Checks the error type and message

    Parameters:
        error_type (str)    : The error type
        message (dict)      : The response message from serializer

    Returns:
        list: Error message with error code
    '''

    if error_type == "DATA_ERROR":

        error_status = [{
                        "status": "error",
                        "data": {
                            "http_code": "400 BAD REQUEST",
                            "errors": [{
                                "error_code": 2000,
                                "error_message": message
                                }]
                            }
                        }]
        return Response(error_status, status=status.HTTP_400_BAD_REQUEST)

    else:
        error_status = [{
            "status": "error",
            "data": {
                "http_code": "500 INTERNAL SERVER ERROR",
                "errors": [{
                    "error_code": 2001,
                    "error_message": "Unknown Internal server error"
                    }]
                }
            }]

        return Response(error_status, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
