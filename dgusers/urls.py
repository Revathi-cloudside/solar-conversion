from rest_framework_nested import routers
from dgusers.views import UserView, OrganizationUserView, RoleMatrixView

router = routers.SimpleRouter()
router.register(r'users', UserView, basename="users")
router.register(r'organization_users', OrganizationUserView, basename="organization_users")
router.register(r'role_matrix', RoleMatrixView, basename="role_matrix")