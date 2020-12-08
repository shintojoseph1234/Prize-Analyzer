"""
Registers models to be used by admin
"""
# django imports
from django.contrib import admin
# local imports
from api.models import (
    Customers,
    Ports,
    Prices,
)

# Registering models
admin.site.register(Customers)
admin.site.register(Ports)
admin.site.register(Prices)
