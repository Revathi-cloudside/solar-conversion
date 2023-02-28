from dgcomments.api_views import V1CommentDataViewSet
from rest_framework_nested import routers

router = routers.SimpleRouter()

router.register(r'cpost', V1CommentDataViewSet, basename="cpost")
