from django.urls import path

from datasink import views

urlpatterns = [
                       path('', views.index, name='index')]
