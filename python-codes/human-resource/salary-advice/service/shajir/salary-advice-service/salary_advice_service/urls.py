"""salary_advice_service URL Configuration"""
from django.contrib import admin

from django.urls import path, include

urlpatterns = [
   # path('admin/', admin.site.urls),
    path('', include('advice.urls')),
]
