from django.urls import path, re_path

from dataglen import ui_views, charts_views
from rest_framework.urlpatterns import format_suffix_patterns
from django.views.generic import TemplateView

from dataglen import views
from django.urls import reverse
from dashboards.views import OrganizationEmployeeCreate, DataglenGroupCreate, GroupMemberCreate, \
    DataglenGroupUpdate

urlpatterns = [
                       re_path(r'dashboard/', views.DashboardData.as_view(), name='dashboard'),
                       path('policy/', TemplateView.as_view(template_name="dataglen/pp.html"), name="privacy_policy"),

                       re_path(r'sources/', views.SourceListView.as_view(), name='source-list'),
                       re_path(r'source/(?P<source_key>[\w]+)/$', views.SourceData.as_view(), name="source-detail"),
                       re_path(r'source/(?P<source_key>[\w]+)/delete/$', views.SourceDeleteView.as_view(),
                           name="source-delete"),
                       re_path(r'source/(?P<source_key>[\w]+)/nebula/$', views.NebulaView.as_view(),
                           name="nebula-view"),
                       re_path(r'create/source/', views.SourceCreateView.as_view(), name="source-create"),
                       re_path(r'source/(?P<source_key>[\w]+)/(?P<stream_name>[\w]+)/$', views.StreamDeleteView.as_view(),
                           name="stream-delete"),
                       re_path(r'source/(?P<source_key>[\w]+)/update/(?P<stream_id>[\w]+)/$',
                           views.StreamUpdateView.as_view(),
                           name="stream-update"),
                       re_path(r'template/(?P<source_key>[\w]+)/$', views.ApplyTemplate.as_view(), name="apply_template"),
                       re_path(r'update/(?P<source_key>[\w]+)/$', views.SourceUpdateView.as_view(), name="source-update"),
                       re_path(r'monitoring/', views.MonitoringStatus.as_view(), name='monitoring_status'),
                       path('discarded/', views.DiscardedRecordsStatsForSources.as_view(),
                           name="discarded-stats"),
                       re_path(r'discarded/(?P<source_key>[\w]+)/$', views.DiscardedRecordsForSource.as_view(),
                           name="discarded-source"),
                       path('data/', views.SourcesList.as_view(), name="view-data"),
                       re_path(r'streams/create/(?P<source_key>[\w]+)/$', views.StreamCreateView.as_view(),
                           name="stream-create"),
                       re_path(r'profile', views.UserProfile.as_view(), name='user-profile'),

                       re_path(r'employees', OrganizationEmployeeCreate.as_view(template_name="dataglen/add_employee.html",
                                                                            success_url=reverse_lazy("dataglen:employee-add")),
                           name='employee-add'),
                       re_path(r'members', GroupMemberCreate.as_view(template_name="dataglen/add_member.html",
                                                                 success_url=reverse_lazy("dataglen:member-add")),
                           name='member-add'),
                       re_path(r'groups', DataglenGroupCreate.as_view(template_name="dataglen/add_group.html",
                                                                  success_url=reverse_lazy("dataglen:group-add")),
                           name='group-add'),
                       re_path(r'group/(?P<slug>[a-z0-9-_]+)/$', DataglenGroupUpdate.as_view(template_name="dataglen/update_group.html",
                                                                  success_url=reverse_lazy("dataglen:group-add")),
                           name='group-sensor-update'),

                       #url(r'upload/(?P<source_key>[\w]+)/$', ui_views.upload, name="upload_data"),
                       # TODO remove this function later. use the data retrieval api directly.
                       re_path(r'scatter_plot/', charts_views.scatter_data, name="scatter_data"),
                       re_path(r'get_heat_map_week_data/(?P<identifier>[\w]+)/$', views.HeatMapData.as_view(),
                           name='get_heat_map_week_data')]

urlpatterns = format_suffix_patterns(urlpatterns)

app_name = 'dataglen'
