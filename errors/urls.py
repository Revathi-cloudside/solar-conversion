from django.urls import re_path
from rest_framework.urlpatterns import format_suffix_patterns
from errors import views 
from django.urls import reverse

urlpatterns = [
                       re_path(r'error_streams/create/(?P<source_key>[\w]+)/$', views.ErrorStreamCreateView.as_view(),
                           name="error-stream-create")]

urlpatterns = format_suffix_patterns(urlpatterns)

app_name = 'errors'