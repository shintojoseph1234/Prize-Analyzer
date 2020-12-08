"""
prices_task URL Configuration
"""
# Django imports
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    # include admin urls
    path('admin/', admin.site.urls),
    # include api app urls
    path('api/', include('api.urls')),
]
