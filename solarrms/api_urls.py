from rest_framework_nested import routers
from solarrms.api_views import PlantsViewSet, InvertersViewSet, InvertersDataSet, PlantsEnergyData, \
    InverterEnergyData, PlantsPowerData, PlantEventsViewSet, PerformanceRatioData, PlantSummaryView, \
    PlantTicketViewSet, PlantTicketNewViewSet, TicketFollowUpView,CUFDataView, GroupsPowerData, SolarClientView, EnergyLossView, \
    PowerIrradiationData, V1_SolarClientView, V1_PlantSummaryView, V1_InverterLiveStatusView, PlantResidualData, \
    InvertersTotalYield, PlantDevicesView, InvertersTotalYieldExcel, MultipleDevicesMultipleStreamsView, PlantExcelReport,\
    EnergyPredictionView, CleaningDumpView, PlantKPIValues, MultipleDevicesMultipleStreamsDownloadView, SpecificYieldData, \
    V1_MobileSolarClientView, V1_AC_SLD_LiveStatusView, V1_PlantEnergyViewSet, AcrossPlantsDevicesView, DeviceTicketDetails,\
    PlantsSummaryDateRange,PlantAssociationViewSet, IdentifierTicketDetails, V1_WeatherDataViewSet,\
    V1_NewPredictionDataViewSet, V1_Insolation_View, InvertersEnergyFromPowerDaterange, AcrossPlantsInverters, PlantPdfReport,\
    V1_DSM_Charge_View, V1_DSM_Charge_Missing_Data_View, PortfolioExcelReport, MultipleDevicesMultipleStreamsDownloadViewNew

from widgets.views import WidgetViewSet, ClientWidgetViewSet

from solarrms.mobile_app.api_views import V1_Mobile_Client_Summary_CEO_View, V1_Mobile_Client_Summary_OandM_Manager_View,\
    V1_Mobile_Select_Plant_View, V1_Mobile_Plant_Summary_View

from oandmmanager.views import OandMPreferencesView, OandMTasksListView, OandMTaskItemView

from solarrms.api_views_v2 import EditUserPreferences, EditPlantPreferences, EditUserProfile,\
    UserSolarPlantWigetsConfigView, UserTableWidgetsConfigView, PlantGroupView, DataglenClientView,\
    V2_NewPredictionDataViewSet, GECleaningTrigger, CustomReportFormatView, OneDayPDFReport, PVSystAchievementReportDownload,\
    MonthlyGenerationBill, MonthlyPDFReport, AllPlantsDetails
from eventsframework.api_views import EventDetailViewSet, CompanyView, FieldTechnicianView, MaintenanceContractView

from solarrms2.api_views import BillingEntityView, BankAccountView, SolarEventsPriorityMappingView, \
    EnergyOffTakerView, EnergyContractView

from dganalysis.api import DataAnalysisViewSet, QueryOptionViewSet, AggregationFunctionViewSet, \
    DruidAnalysisViewSet, DevicesListViewSet, AnalysisDashboardView

router = routers.SimpleRouter()
router.register(r'plants', PlantsViewSet, basename="plants")

plants_router = routers.NestedSimpleRouter(router, r'plants', lookup='plant')
plants_router.register(r'inverters', InvertersViewSet, basename="inverters")
plants_router.register(r'energy', PlantsEnergyData, basename="plant-energy")
plants_router.register(r'residual', PlantResidualData, basename="plant-residual")
plants_router.register(r'power', PlantsPowerData, basename="plant-power")
plants_router.register(r'events', PlantEventsViewSet, basename="plant-events")
plants_router.register(r'status', PlantSummaryView, basename="plant-status")
plants_router.register(r'performance', PerformanceRatioData, basename="plant-performance")
plants_router.register(r'specific_yield', SpecificYieldData, basename="plant-specific_yield")
plants_router.register(r'tickets', PlantTicketViewSet, basename="tickets")
plants_router.register(r'newtickets', PlantTicketNewViewSet, basename="newtickets")
plants_router.register(r'associations', PlantAssociationViewSet, basename="associations")
plants_router.register(r'CUF', CUFDataView, basename="CUF")
plants_router.register(r'groups-power', GroupsPowerData, basename="groups-power")
plants_router.register(r'losses', EnergyLossView, basename="energy-loss")
plants_router.register(r'irradiation-power', PowerIrradiationData, basename="plant-irradiation-power")

inverter_router = routers.NestedSimpleRouter(plants_router, r'inverters', lookup="plant")
inverter_router.register(r'data', InvertersDataSet, basename="data")
inverter_router.register(r'energy', InverterEnergyData, basename="inverter-energy")

ticket_router = routers.NestedSimpleRouter(plants_router, r'tickets', lookup='plant')
ticket_router.register(r'followups', TicketFollowUpView, basename='followups')

router2 = routers.SimpleRouter()
router2.register(r'summary', SolarClientView, basename='summary')

v1_router = routers.SimpleRouter()
v1_router.register(r'client/summary',V1_SolarClientView, basename='v1_client_summary')
v1_router.register(r'plants_summary',PlantsSummaryDateRange, basename='v1_plants_summary_date_range')
v1_router.register(r'inverters_energy',InvertersEnergyFromPowerDaterange, basename='v1_inverters_energy_date_range')
v1_router.register(r'client/summary/mobile',V1_MobileSolarClientView, basename='v1_client_summary_mobile')

v1_router.register(r'client/widgets/data',ClientWidgetViewSet, basename='v1_client_widget_data')

v1_router.register(r'client/summary/mobile/ceo',V1_Mobile_Client_Summary_CEO_View, basename='v1_client_summary_mobile_ceo')
v1_router.register(r'client/summary/mobile/OandM',V1_Mobile_Client_Summary_OandM_Manager_View, basename='v1_client_summary_mobile_OandM')
v1_router.register(r'client/summary/mobile/select',V1_Mobile_Select_Plant_View, basename='v1_client_summary_select_a_plant')
v1_router.register(r'plant/summary/mobile',V1_Mobile_Plant_Summary_View, basename='v1_plant_summary_mobile')

v1_router.register(r'client/portfolio-report',PortfolioExcelReport, basename='v1_client_portfolio_report')

v1_router.register(r'devices',AcrossPlantsDevicesView, basename='v1_across_plants_devices')
v1_router.register(r'devices/inverters',AcrossPlantsInverters, basename='v1_across_plants_inverters')

v1_plants_router = routers.SimpleRouter()
v1_plants_router.register(r'plants', PlantsViewSet, basename="plants")
v1_plants_router_nested = routers.NestedSimpleRouter(v1_plants_router, r'plants', lookup='plant')
v1_plants_router_nested.register(r'summary', V1_PlantSummaryView, basename="v1_plant_summary")
v1_plants_router_nested.register(r'live', V1_InverterLiveStatusView, basename="v1_inverter_live_data")
v1_plants_router_nested.register(r'live/ac', V1_AC_SLD_LiveStatusView, basename="v1_ac_sld_live_data")
v1_plants_router_nested.register(r'total_yield', InvertersTotalYield, basename="v1_plant_total_yield")
v1_plants_router_nested.register(r'energy/new', V1_PlantEnergyViewSet, basename="v1_plant_energy")
v1_plants_router_nested.register(r'insolation', V1_Insolation_View, basename="v1_plant_insolation")
v1_plants_router_nested.register(r'dsm', V1_DSM_Charge_View, basename="v1_dsm_view")
v1_plants_router_nested.register(r'dsm/missing', V1_DSM_Charge_Missing_Data_View, basename="v1_dsm_missing_view")
v1_plants_router_nested.register(r'devices', PlantDevicesView, basename="v1_plant_devices")
v1_plants_router_nested.register(r'total_yield_excel', InvertersTotalYieldExcel, basename="v1_plant_total_yield_excel")
v1_plants_router_nested.register(r'multiple_devices_streams', MultipleDevicesMultipleStreamsView, basename="v1_multiple_devices_multiple_streams")
v1_plants_router_nested.register(r'multiple_devices_streams/data/download', MultipleDevicesMultipleStreamsDownloadView, basename="v1_multiple_devices_multiple_streams_data_download")
v1_plants_router_nested.register(r'multiple_devices_streams/data/download/new', MultipleDevicesMultipleStreamsDownloadViewNew, basename="v1_multiple_devices_multiple_streams_data_download_new")
v1_plants_router_nested.register(r'report', PlantExcelReport, basename="v1_plant_report")
v1_plants_router_nested.register(r'prediction_dump', EnergyPredictionView, basename="v1_prediction_dump")
v1_plants_router_nested.register(r'cleaning_dump', CleaningDumpView, basename="v1_cleaning_dump")
v1_plants_router_nested.register(r'kpi', PlantKPIValues, basename="v1_kpi")
v1_plants_router_nested.register(r'ticket_details', DeviceTicketDetails, basename="v1_device_ticket_details")
v1_plants_router_nested.register(r'widgets/data', WidgetViewSet, basename="v1_widget_data")
v1_plants_router_nested.register(r'association_details', IdentifierTicketDetails, basename="v1_association_details")


v1_plants_router_nested.register(r'oandmmanager/taskitem', OandMTasksListView, basename="v1_oandm_tasks")
v1_plants_router_nested.register(r'oandmmanager/taskitem/association', OandMTaskItemView, basename="v1_oandm_task_items")
v1_plants_router_nested.register(r'oandmmanager/preferences', OandMPreferencesView, basename="v1_oandm_preferences")
v1_plants_router_nested.register(r'weather-data', V1_WeatherDataViewSet, basename="v1_plant_weather_data")

v1_plants_router_nested.register(r'prediction-data', V1_NewPredictionDataViewSet, basename="v1_plant_weather_data")
v1_plants_router_nested.register(r'prediction-data-v2', V2_NewPredictionDataViewSet, basename="v1_plant_weather_data")
v1_plants_router_nested.register(r'pdf-report', PlantPdfReport, basename="v1_plant_pdf_report")
v1_plants_router_nested.register(r'onedaypdf', OneDayPDFReport, basename="v1_onedaypdf")
v1_plants_router_nested.register(r'monthlypdf', MonthlyPDFReport, basename="v1_onedaypdf")
v1_plants_router_nested.register(r'monthly_bill', MonthlyGenerationBill, basename="v1_monthly_bill")
v1_plants_router_nested.register(r'cleaning-trigger', GECleaningTrigger, basename="v1_cleaning_trigger")

v1_router.register(r'edituserpreferences', EditUserPreferences, basename="edituserpreferences")
v1_router.register(r'editplantpreferences', EditPlantPreferences, basename="editplantpreferences")

v1_router.register(r'client/events', EventDetailViewSet, basename='v1_client_events')

v1_router.register(r'edituserprofile', EditUserProfile, basename="edit_user_profile")

v1_router.register(r'userplantwidgetconfig', UserSolarPlantWigetsConfigView,
                   basename="usersolarplantwigetsconfigview")

#solarrms2
v1_router.register(r'billingentityview', BillingEntityView, basename="billing_entity_view")
v1_router.register(r'bankaccountview', BankAccountView, basename="bank_account_view")
v1_router.register(r'energyofftaker', EnergyOffTakerView, basename="energy_offtaker_view")
v1_router.register(r'priority_mappings', SolarEventsPriorityMappingView,
                   basename="solar_events_priority_mapping_view")
v1_router.register(r'energycontract', EnergyContractView, basename="energy_contract_view")

v1_router.register(r'widgets_config', UserTableWidgetsConfigView, basename="user_table_widgets_config_view")
v1_router.register(r'dataglenclientview', DataglenClientView, basename="dataglen_client_view")
v1_router.register(r'pvsyst_achievement', PVSystAchievementReportDownload, basename="pvsyst_achievement_report_dowlnoad")

#group
plants_router.register(r'groups', PlantGroupView, basename="solar_groups")

v1_router.register(r'companyview', CompanyView, basename="company_view")
v1_router.register(r'ftview', FieldTechnicianView, basename="field_technician_view")
v1_router.register(r'maintenance_contract', MaintenanceContractView, basename="maintenance_contract_view")
v1_router.register(r'custom_report_format', CustomReportFormatView, basename="custom_report_format_view")

v1_router.register(r'analysis', DataAnalysisViewSet, basename="analysis")
v1_router.register(r'options', QueryOptionViewSet, basename="analysis_options")
v1_router.register(r'functions', AggregationFunctionViewSet, basename="analysis_functions")
v1_router.register(r'datawh', DruidAnalysisViewSet, basename="datawh")
v1_router.register(r'deviceslist', DevicesListViewSet, basename="deviceslist")
v1_router.register(r'analysis_dashboards', AnalysisDashboardView, basename="analysis_dashboards")
v1_router.register(r'ap_data', AllPlantsDetails, basename="ap_data")
