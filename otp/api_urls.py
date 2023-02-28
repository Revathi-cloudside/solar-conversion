from .api_view import V1_OTPDataViewSet
from rest_framework_nested import routers

router = routers.SimpleRouter()

router.register(r'generate-validate', V1_OTPDataViewSet, basename="generate_validate")