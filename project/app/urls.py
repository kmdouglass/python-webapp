from django.urls import path

from .views import foo

urlpatterns = [
    path('', foo, name='foo')
]
