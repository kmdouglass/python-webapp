from django.urls import path

from .views import Foo

urlpatterns = [
    path('', Foo.as_view(), name='foo')
]
