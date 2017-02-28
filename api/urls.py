from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns

from api import views

urlpatterns = [
    url(r'^property/$', views.property_list),
    url(r'^property/(?P<pk>[0-9]+)/$', views.property_detail),
    url(r'^price/$', views.price_list),
    url(r'^price/(?P<pk>[0-9]+)/$', views.price_detail),
    url(r'^unit/$', views.unit_list),
    url(r'^unit/(?P<pk>[0-9]+)/$', views.unit_detail),
    url(r'^test/$', views.test),
    url(r'^test/(?P<pk>[0-9]+)$', views.test_detail),
]