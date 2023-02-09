from django.urls import re_path
from rest_framework.urlpatterns import format_suffix_patterns
from django.urls import reverse_lazy
from reports1 import views


urlpatterns = [
                       re_path(r'sources/(?P<source_key>[\w]+)/$',
                           views.GeneratePDFReportView.as_view(),
                           name="pdf-create")]

urlpatterns = format_suffix_patterns(urlpatterns)

app_name = 'reports'