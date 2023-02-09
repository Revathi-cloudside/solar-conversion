from django.views.generic import TemplateView
from django.urls import path

urlpatterns = [
    path('hd/',
        TemplateView.as_view(template_name="tickets.html")),
]