"""
Serializers defined for Api app
"""
# REST imports
from rest_framework import serializers



class MyPricesSerializer(serializers.Serializer):
    """
    Serializer serializes day, customer
    """
    day      = serializers.DateField()
    customer = serializers.CharField()



class ComparePricesSerializer(serializers.Serializer):
    """
    Serializer serializes day, price,currency, origin_code, destination_code
    """
    day                 = serializers.DateField()
    price               = serializers.FloatField()
    currency            = serializers.CharField(max_length=5)
    origin_code         = serializers.CharField(max_length=5)
    destination_code    = serializers.CharField(max_length=5)
