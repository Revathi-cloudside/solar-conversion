from rest_framework_nested import routers
from rest.views import SourcesViewSet, StreamsViewSet, DataRecordsSet, MultipleDataRecordsSet, MultipleSourcesDataRecords, TimeSeriesDataRecords, SMSManagerViewSet, ContactUsViewSet
from django.urls import include, path, re_path
from action.views import ActionRecordsSet
from action.stream_views import ActionStreamsViewSet
from config.stream_views import ConfigStreamsViewSet
from config.views import ConfigRecordsSet
from solarrms.api_urls import router as solar_router
from solarrms.api_urls import inverter_router 
from solarrms.api_urls import plants_router, ticket_router, router2, v1_router, v1_plants_router, v1_plants_router_nested
from rest import views
from events.views import EventsViewSet
from customwidgets.views import WidgetsViewSet
from errors.views import ErrorStreamsViewSet, ErrorRecordsSet
from dwebdyn.urls import router as dataentry_router
from dgusers.urls import router as dg_users_router
from otp.api_urls import router as otp_router
from dgcomments.api_urls import router as comment_router
from solarrms.api_views_v2 import ConnectionTest, GetCurrentTime, DataTransferKaco

router = routers.SimpleRouter()
router.register(r'sources', SourcesViewSet, basename="sources")
router.register(r'contactUs', ContactUsViewSet, basename='contactUs')

sources_router = routers.NestedSimpleRouter(router, r'sources', lookup='source')
sources_router.register(r'streams', StreamsViewSet, basename="streams")
sources_router.register(r'data', DataRecordsSet, basename="data")
sources_router.register(r'action', ActionRecordsSet, basename="action")
sources_router.register(r'action_streams', ActionStreamsViewSet, basename="action_streams")
sources_router.register(r'config_streams', ConfigStreamsViewSet, basename="config_streams")
sources_router.register(r'config', ConfigRecordsSet, basename="config")
#commenting out below line so as change errors API url.
#sources_router.register(r'events', EventsViewSet, base_name="events")
sources_router.register(r'events', ErrorRecordsSet, basename="events")
sources_router.register(r'error_streams', ErrorStreamsViewSet, basename='error_streams')

router.register(r'multisources/data', MultipleDataRecordsSet, basename="multisources")
router.register(r'widgets', WidgetsViewSet, basename="widgets")
router.register(r'msources/data', MultipleSourcesDataRecords, basename="multiplesources")
router.register(r'timeseries/data', TimeSeriesDataRecords, basename="timeseriesdata")
router.register(r'sms', SMSManagerViewSet, basename="send-sms")


router.register(r'public/connectiontest', ConnectionTest, basename='connection_test')
router.register(r'public/time', GetCurrentTime, basename='get_current_time')
router.register(r'import/inverterdata', DataTransferKaco, basename='data_transfer_kaco')


urlpatterns = [
    re_path(r'docs/', views.docs, name='docs'),
    path('', include(router.urls)),
    path('', include(sources_router.urls)),
    path('solar/', include(solar_router.urls)),
    path('solar/', include(router2.urls)),
    path('solar/', include(plants_router.urls)),
    path('solar/', include(inverter_router.urls)),
    path('solar/', include(ticket_router.urls)),
    path('v1/solar/', include(v1_router.urls)),
    path('v1/solar/', include(v1_plants_router.urls)),
    path('v1/solar/', include(v1_plants_router_nested.urls)),
    path('v1/plant/', include(dataentry_router.urls)),
    path('v1/solar/', include(dg_users_router.urls)),
    path('v1/otp/', include(otp_router.urls)),
    path('v1/comments/', include(comment_router.urls)),
]

app_name = 'rest'


