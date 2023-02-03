from django.urls import re_path

from dataglen import ui_views, charts_views
from rest_framework.urlpatterns import format_suffix_patterns

from config import views 
from django.urls import reverse
from dashboards.views import OrganizationEmployeeCreate, DataglenGroupCreate, GroupMemberCreate, \
    DataglenGroupUpdate

urlpatterns =[
                       re_path(r'config_streams/create/(?P<source_key>[\w]+)/$', views.ConfigStreamCreateView.as_view(),
                           name="config-stream-create"),]

urlpatterns = format_suffix_patterns(urlpatterns)

app_name = 'config'