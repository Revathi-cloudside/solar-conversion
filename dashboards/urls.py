from . import views

from django.urls import re_path


urlpatterns = [
                       re_path(r'error/', views.ErrorView.as_view(), name='500_error_view'),
                       re_path(r'redirect/', views.EntryPointPostLogin.as_view(), name='post_successful_login'),
                       re_path(r'dglogin/', views.DataGlenLoginView.as_view(), name='dataglen_login')]

app_name = 'dashboards'