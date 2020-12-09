"""
Utility functions for Api app
"""
# Other imports
import requests
# Django imports
from django.conf import settings
from django.db import connection

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
    params = {'app_id':exchange_app_id}
    # base url
    url = exchange_rates_url
    # GET request
    response_data = requests.get(url=url, params=params)
    # extracting data in json format
    data = response_data.json()
    # USD rate of corresponding currency
    usd_rate = data['rates'][currency_code.upper()]
    # convert price into USD
    usd_price = price/usd_rate
    # return usd_price
    return usd_price
