from django.urls import include, path, re_path
from ioelab import views
from ioelab.views import InviteViewSet
from rest_framework.urlpatterns import format_suffix_patterns
from django.urls import reverse_lazy
from rest_framework_nested import routers


'''
urlpatterns = patterns('',
                       url(r'^invite$', views.InviteList.as_view()),
                       url(r'^invite(?P<pk>[0-9]+)/$', views.InviteDetail.as_view()),)

urlpatterns = format_suffix_patterns(urlpatterns)
'''



router = routers.SimpleRouter()
router.register(r'invite', InviteViewSet, basename="invite")

urlpatterns = [
    #url(r'docs/', views.docs, name='docs'),
    re_path(r'^ValidateUID/', views.ValidateUIDView.as_view(), name='validate-UID'),
    path('', include(router.urls)),

]

app_name = 'ioelab'