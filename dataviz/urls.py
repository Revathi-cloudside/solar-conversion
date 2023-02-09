from django.urls import path
from dataviz import views

urlpatterns = [
		               path('', views.index, name="index"),
                       path('show_data/', views.show_data, name='show_data'),
                       path('show_live_data/', views.show_live_data, name='show_live_data'),
                       path('data_status/', views.generate_data_status, name='generate_data_status'),
]
