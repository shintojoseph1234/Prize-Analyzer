"""
Api app URL Configuration
"""
# Django imports
from django.urls import path
# REST imports
from rest_framework.documentation import include_docs_urls
# local imports
from api import views

from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    # API doc
    path('', include_docs_urls(title='Prices Task API', public=True)),
    # GET average_price for each day
    path('my-prices/<str:day>/<str:customer>/', views.my_prices, name="my_prices"),
    # POST upload_usd_price
    path('compare-price/', views.ComparePriceViewSet.as_view(), name="compare-price"),

]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
