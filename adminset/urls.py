from django.conf.urls import include,url
from django.contrib import admin
from django.conf import settings
import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^cmdb/', include('cmdb.urls')),
    url(r'^navi/', include('navi.urls')),
    url(r'^admin/', admin.site.urls),
    url(r'^setup/', include('setup.urls')),
    url(r'^monitor/', include('monitor.urls')),
    url(r'^config/', include('config.urls')),
    url(r'^accounts/', include('accounts.urls')),
    url(r'^appconf/', include('appconf.urls')),
    url(r'^dbmanage/',include('dbmanage.urls')),
    url(r'^test/$',views.test,name='test'),
    url(r'^add/$',views.add,name='add'),
    url(r'^ajax_dict',views.ajax_dict,name='ajax_dict'),
    url(r'^ajax_list',views.ajax_list,name='ajax_list'),
    url(r'^forbidden/',views.forbidden,name='forbidden'),

]