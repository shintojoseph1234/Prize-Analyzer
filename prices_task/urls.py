"""
prices_task URL Configuration
"""
# Django imports
from django.contrib import admin
from django.urls import path, include
# Swagger imports
from rest_framework_swagger.views import get_swagger_view

from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    # include admin urls
    path('admin/', admin.site.urls),
    # include api app urls
    path('api/', include('api.urls')),
    # # awagger API views
    path('', get_swagger_view(title='Price Analyzer')),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
