"""
Models required for Api app
"""
# django imports
from django.db import models


class Customers(models.Model):
    """
    Customers model store all customers name
    """
    customer = models.CharField(null=True, blank=True, max_length=200)

    def __str__(self):
        return str(self.customer)


class Ports(models.Model):
    """
    Ports model store all port names and its code
    """
    code = models.CharField(blank=True, null=True, max_length=5)
    name = models.CharField(blank=True, null=True, max_length=200)

    def __str__(self):
        return str(self.name)


class Prices(models.Model):
    """
    Prices model store day and price
    with relation to customer from Customer table,
    and origin and destination from Ports table
    """
    day         = models.DateField(blank=True, null=True)
    price       = models.IntegerField(blank=True, null=True, default=0)
    customer    = models.ForeignKey(Customers, on_delete=models.CASCADE)
    orig_code   = models.ForeignKey(
                        Ports,
                        on_delete=models.CASCADE,
                        related_name='orig_code',null=True
                        )
    dest_code   = models.ForeignKey(
                        Ports,
                        on_delete=models.CASCADE,
                        related_name='dest_code', null=True
                        )

    def __str__(self):
        return str(self.dest_code)
