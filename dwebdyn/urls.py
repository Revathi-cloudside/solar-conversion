from rest_framework_nested import routers
from dwebdyn.views import CreatePlantsView, CreatePlantDevicesView, CreateDelRemoPlantInvertersView
from dwebdyn.views_v2 import CreatePlantDevicesViewVersion2, FTPDetailsViewV2

router = routers.SimpleRouter()
router.register(r'entry', CreatePlantsView, basename="entry")
router.register(r'ftpdata', FTPDetailsViewV2, basename="ftpdata")
router.register(r'devices', CreatePlantDevicesView, basename="devices")
router.register(r'webdyn', CreatePlantDevicesViewVersion2, basename="webdyn")

router.register(r'delremo', CreateDelRemoPlantInvertersView, basename="delremo")

dataentry_router = routers.NestedSimpleRouter(router, r'entry', lookup='entry')
