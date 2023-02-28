from django.urls import path
from solarrms.admin_views import AdminInverterView, AdminMeterView, \
    AdminSetMultiplicationFactorView, get_solar_group_for_plant_admin,\
    get_source_for_plant_group_admin, get_stream_for_sources_admin, AdminAJBView,\
    AdminAddClientAndPlantView, AdminSolarFieldView, AdminPayloadErrorCheckView,\
    get_solar_plant, AdminResetPasswordView

urlpatterns = [
                       path('inverter/', AdminInverterView.as_view()),
                       path('meter/', AdminMeterView.as_view()),
                       path('multiplication-factor/', AdminSetMultiplicationFactorView.as_view()),
                       path('ajb/', AdminAJBView.as_view()),
                       path('get-solar-plant/', get_solar_plant),
                       path('get-solar-group-for-plant/', get_solar_group_for_plant_admin),
                       path('get-source-key/', get_source_for_plant_group_admin),
                       path('get-source-stream/', get_stream_for_sources_admin),
                       path('add_client_and_plant/', AdminAddClientAndPlantView.as_view()),
                       path('solar-field/', AdminSolarFieldView.as_view()),
                       path('payload-error-check/', AdminPayloadErrorCheckView.as_view()),
                       path('reset-password/', AdminResetPasswordView.as_view()),
]
