from django.urls import path
from django.views.generic import TemplateView

urlpatterns = [
	path('home/', TemplateView.as_view(template_name="website/index.html"), name="home"),
    path('customers/', TemplateView.as_view(template_name="website/customers.html"), name="customers"),
    path('team/', TemplateView.as_view(template_name="website/team.html"), name="team"),
    path('faq/', TemplateView.as_view(template_name="website/faq.html"), name="faq"),
    path('life_at_dataglen/', TemplateView.as_view(template_name="website/lifeatdataglen.html"), name="life_at_dataglen"),
    path('gmap-demo/', TemplateView.as_view(template_name="website/gmap-demo.html"), name="gmapdemo"),
]

app_name = 'website'