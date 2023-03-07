"""kutbill URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path

from django.conf import settings
from django.conf.urls.static import static
from organizations.backends import invitation_backend
from website.views import index
from rest_framework.authtoken import views
import debug_toolbar
from dgusers import views as dgviews
from license import views as lviews

urlpatterns = [ 
    path('admin/', admin.site.urls),
    #admin utility url
    path('admin/solarrms/utility/', include('solarrms.admin_urls')),
    path('', index, name='landing_page'),
    path('web/', include('website.urls', namespace='website')),
    path('dashboards/', include('dashboards.urls', namespace='dashboards')),  
    path('dataglen/', include('errors.urls', namespace="errors")),
    path('dataglen/', include('config.urls', namespace="config")),
    path('dataglen/', include('action.urls', namespace="action")),
    path('events/', include('events.urls', namespace="events")),
    path('reports/', include('reports.urls', namespace="reports")),
    path('dataglen/', include('dataglen.urls', namespace="dataglen")),
    path('solar/', include('solarrms.urls', namespace="solar")),
    path('ioelab/', include('ioelab.urls', namespace="ioelab")),
    path('api/', include('rest.urls', namespace="api")),
    re_path('api-token-auth/', dgviews.DataGlenObtainAuthToken.as_view()),
    path('accounts/', include('allauth.urls')),
    path('invitations/', include(invitation_backend().get_urls())),
    path('hijack/', include('hijack.urls')),
    path('helpdesk/', include('helpdesk.urls')),
    path('dh/', include('ticketingsystem.urls')),
    re_path(r'validate/', lviews.validate_signature),
    re_path(r'add_signature/', lviews.add_signature),
    re_path(r'delete_signature/', lviews.delete_signature),
    #SWAGGER DOCS
    #path('swagger/', include('rest_framework_swagger.urls')),
  ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
