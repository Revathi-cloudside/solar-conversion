from django.urls import path, re_path
from . import views
from dashboards.views import OrganizationEmployeeCreate, GroupMemberCreate
from django.urls import reverse
from .csv_download_views import CSVDownload, CSVDownloadUpdated
from .report_views import GenerateInverterLevelPDFReportView, GeneratePlantLevelPDFReportView


urlpatterns = [
                       re_path(r'client/', views.SolarClient.as_view(),
                           name='index'),
                       re_path(r'plant/(?P<plant_slug>[\w-]+)/$', views.SolarPlantView.as_view(),
                           name='plant'),
                       # url(r'plant/new/(?P<plant_slug>[\w-]+)/$', views.SolarPlantViewNew.as_view(),
                       #     name='plant'),

                       re_path(r'employees', OrganizationEmployeeCreate.as_view(template_name="solarmonitoring/add_employee.html",
                                                                            success_url=reverse_lazy("solar:employee-add")),
                           name='employee-add'),

                       re_path(r'plants', views.SolarPlantCreate.as_view(template_name="solarmonitoring/add_group.html",
                                                                     success_url=reverse_lazy("solar:group-add")),
                           name='group-add'),

                       re_path(r'customers', GroupMemberCreate.as_view(template_name="solarmonitoring/add_member.html",
                                                                   success_url=reverse_lazy("solar:customer-add")),
                           name='customer-add'),

                       re_path(r'status/(?P<plant_slug>[\w-]+)/$',
                           views.InvertersStatusPage.as_view(),
                           name='inverters-status'),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/devices/$', 
                           views.SolarPlantDevicesList.as_view(),
                           name='devices-list'),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/feeder/add/$',
                           views.FeederAdd.as_view(),
                           name='feeder-add'),
                       re_path(r'plant/(?P<plant_slug>[\w]+)/feeder/(?P<feeder_key>[\w]+)/update/$', 
                           views.FeederUpdate.as_view(), 
                           name="feeder-update"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/inverter/add/$', 
                           views.IndependentInverterCreate.as_view(), 
                           name="inverter-add"),


                       re_path(r'plant/(?P<plant_slug>[\w-]+)/inverter/(?P<inverter_key>[\w-]+)/compare/$',
                           views.IndependentInverterCompareAndDownloadValues.as_view(
                               template_name="solarmonitoring/compare_inverter_values.html"),
                               name="inverter-data-comparison"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/inverter/(?P<inverter_key>[\w-]+)/download/$',
                           views.IndependentInverterCompareAndDownloadValues.as_view(
                               template_name="solarmonitoring/download_inverter_values.html"),
                               name="inverter-data-download"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/compare/$',
                           views.PlantIndependentInverterCompareValues.as_view(
                               template_name="solarmonitoring/compare_plant_inverters.html"),
                               name="plant-inverters-compare"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/table/$',
                           views.PlantIndependentInverterCompareValues.as_view(
                               template_name="solarmonitoring/plant_table.html"),
                               name="plant-inverters-data-table"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/reports/$',
                           views.PlantIndependentInverterCompareValues.as_view(
                               template_name="solarmonitoring/reports.html"),
                               name="reports"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/data-comparison/$',
                           views.PlantIndependentInverterCompareValues.as_view(
                               template_name="solarmonitoring/comparison.html"),
                               name="compare-data"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/inverters_generation/$',
                           views.PlantIndependentInverterCompareValues.as_view(
                               template_name="solarmonitoring/inverter_energy_generation.html"),
                               name="plant-inverters-energy-generation"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/plant_generation/$',
                           views.PlantIndependentInverterCompareValues.as_view(
                               template_name="solarmonitoring/niftyenergy.html"),
                               name="plant-energy-generation"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/plant_power/$',
                           views.PlantIndependentInverterCompareValues.as_view(
                               template_name="solarmonitoring/niftypower.html"),
                               name="plant-power-values"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/data_download/$',
                           views.PlantIndependentInverterCompareValues.as_view(
                               template_name="solarmonitoring/inverter_data_download.html"),
                               name="inverter-data-download"),


                       re_path(r'plant/(?P<plant_slug>[\w]+)/inverter/(?P<inverter_key>[\w]+)/update/$',
                           views.IndependentInverterUpdate.as_view(), 
                           name="inverter-update"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/(?P<feeder_key>[\w]+)/finverter/add/$', 
                           views.InverterAdd.as_view(),
                           name='finverter-add'),
                       re_path(r'plant/(?P<plant_slug>[\w]+)/finverter/(?P<finverter_key>[\w]+)/update/$', 
                           views.InverterUpdate.as_view(), 
                           name="finverter-update"),

                       re_path(r'plant/(?P<plant_slug>[\w-]+)/(?P<inverter_key>[\w]+)/ajb/add/$', 
                           views.AJBAdd.as_view(),
                           name='ajb-add'),
                       re_path(r'plant/(?P<plant_slug>[\w-]+)/ajb/(?P<ajb_key>[\w]+)/update/$', 
                           views.AJBUpdate.as_view(),
                           name='ajb-update'),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/inverter/(?P<plant_inverter_key>[\w]+)/data/download/$',
                            CSVDownload.as_view(),
                            name="csv-download"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/data/file/$',
                           CSVDownloadUpdated.as_view(),
                           name="data-csv-download"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/inverter/(?P<source_key>[\w]+)/reports/$',
                           GenerateInverterLevelPDFReportView.as_view(),
                           name="inverter-pdf-report-generate"),
                       re_path(r'plant/(?P<plant_slug>[\w]+)/reports/$',
                           GeneratePlantLevelPDFReportView.as_view(),
                           name="solar-pdf-report-generate"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/meta/$',
                           views.PlantMetaView.as_view(),
                           name="plant-meta-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/meta-download/$',
                           views.PlantMetaDownloadView.as_view(),
                           name="plant-meta_download-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/performance_ratio/$',
                           views.PerformanceRatioView.as_view(),
                           name="plant-performance-ratio-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/compare_table/$',
                           views.CompareTableView.as_view(),
                           name="compare-table-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/report_summary/$',
                           views.ReportSummaryView.as_view(),
                           name="report-summary-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/compare_plant_table/$',
                           views.ComparePlantTableView.as_view(),
                           name="compare-plant-table-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/device_comparisons/$',
                           views.InverterDeviceComparisonsView.as_view(),
                           name="inverter-device-comparisons"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/ticket_list/$',
                           views.TicketsListView.as_view(),
                           name="ticket-list"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/ticket_view/(?P<ticket_id>[\w]+)/$',
                           views.TicketViewView.as_view(),
                           name="ticket-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/cuf/$',
                           views.CUFView.as_view(),
                           name="plant-cuf-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/summary_report/$',
                           views.SummaryViewView.as_view(),
                           name="plant-summary-report-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/client_summary/$',
                           views.ClientSummaryViewView.as_view(),
                           name="plant-client-summary-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/inverter_residuals/$',
                           views.InverterResidualsViewView.as_view(),
                            name="plant-inverters-residual"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/multiple_parameters/$',
                           views.MultipleParametersViewView.as_view(),
                           name="plant-client-multiple_parameters-view"),

                       path('options/add_plant/',
                           views.SolarClientAddPlantLinks.as_view(),
                           name="options-add_plant"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/plant_metrics/$',
                           views.PlantMetricsViewView.as_view(),
                           name="plant-metrics-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/alarms_list/$',
                           views.AlarmsListViewView.as_view(),
                           name="alarms-list-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/inverters_ajbs2/$',
                           views.InvertersAjbsSecondViewView.as_view(),
                           name="inverters-ajbs-second-view"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/add_plant_options/$',
                           views.AddPlantOptionsViewView.as_view(),
                           name="add-plant-options-view"),

                       path('options/plant_parameters/',
                           views.SolarClientCompareClientParametersLinks.as_view(),
                           name="options-plant_parameters"),

                       path('options/preferences/',
                           views.SolarClientLinks.as_view(),
                           name="options-preferences"),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/pdf_report_get/$', views.PDFReportSummary.as_view(),
                           name='pdf-report'),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/pdf_report_monthly_get/$', views.PDFReportSummaryMonthly.as_view(),
                           name='pdf-report-monthly'),

                       re_path(r'plant/(?P<plant_slug>[\w]+)/pdf_bill_get/$', views.GenerateElectricityBill.as_view(),
                           name='pdf-bill')]

app_name = 'solarrms'

