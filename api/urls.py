"""
Api app URL Configuration
"""
# Django imports
from django.urls import path
# REST imports
from rest_framework.documentation import include_docs_urls
from rest_framework.schemas import get_schema_view
# local imports
from api import views


urlpatterns = [
    # API doc
    path('', include_docs_urls(title='Prices Task API', public=True)),
    # # scheme view
    path('schema/', get_schema_view(title="Rate API"), name="schema_view"),
    # GET average_price for each day
    path('my-prices/<str:day>/<str:customer>/', views.my_prices, name="my_prices"),
    # POST upload_usd_price
    path('compare-price/', views.ComparePriceViewSet.as_view(), name="compare-price"),

]
