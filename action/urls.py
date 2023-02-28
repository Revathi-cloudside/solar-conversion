from django.urls import re_path

from dataglen import ui_views, charts_views
from rest_framework.urlpatterns import format_suffix_patterns

from action import views 
from django.urls import reverse
from dashboards.views import OrganizationEmployeeCreate, DataglenGroupCreate, GroupMemberCreate, \
    DataglenGroupUpdate

urlpatterns = [
                       re_path(r'action_streams/create/(?P<source_key>[\w]+)/$', views.ActionStreamCreateView.as_view(),
                           name="action-stream-create")]

urlpatterns = format_suffix_patterns(urlpatterns)

app_name = 'action'