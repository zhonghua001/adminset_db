# -*- coding: utf-8 -*-

from django.conf.urls import url
from django.contrib import admin

from django.conf.urls import include
from django.conf import settings
import dbmanage.myapp.views as myapp_view
from django.views.static import serve
import views


urlpatterns = [

    url(r'^$', myapp_view.index, name='dbmanage'),
    url(r'^edit_conf/$',views.edit_conf,name='edit_conf'),
    # url(r'^$', myapp_view.index, name='index'),

    url(r'^log_query/$', myapp_view.log_query, name='log_query'),
    url(r'^mysql_query/$', myapp_view.mysql_query, name='mysql_query'),
    url(r'^mysql_admin/$', myapp_view.mysql_admin, name='mysql_admin'),
    url(r'^binlog_parse/$', myapp_view.mysql_binlog_parse, name='binlog_parse'),
    url(r'^tb_check/$', myapp_view.tb_check, name='tb_check'),
    url(r'^dupkey_check/$', myapp_view.dupkey_check, name='dupkey_check'),
    url(r'^meta_data/$', myapp_view.meta_data, name='meta_data'),
    url(r'^mysql_exec/$', myapp_view.mysql_exec, name='mysql_exec'),
    # url(r'^captcha/', include('captcha.urls')),
    url(r'^sqlcheck/$', myapp_view.inception, name='inception'),
    url(r'^task/$', myapp_view.task_manager, name='task_manager'),
    url(r'^pre_query/$', myapp_view.pre_query, name='pre_query'),
    url(r'^pass_reset/$', myapp_view.pass_reset, name='pass_reset'),
    url(r'^pre_set/$', myapp_view.pre_set, name='pre_set'),
    url(r'^set_dbgroup/$', myapp_view.set_dbgroup, name='set_dbgroup'),
    url(r'^set_ugroup/$', myapp_view.set_ugroup, name='set_ugroup'),
    url(r'^fast_dbset/$', myapp_view.fast_dbset, name='fast_dbset'),
    url(r'^set_dbname/$', myapp_view.set_dbname, name='set_dbname'),
    url(r'^update_task/$', myapp_view.update_task, name='update_task'),
    url(r'^get_rollback/$', myapp_view.get_rollback, name='get_rollback'),
    url(r'^get_single_rollback/$', myapp_view.get_single_rollback, name='get_single_rollback'),
    url(r'^get_tblist/$', myapp_view.get_tblist, name='get_tblist'),
    url(r'^diff/$', myapp_view.diff, name='diff'),
    # url(r'^salt/', include('salt.urls')),
    url(r'^dbmonitor/', include('dbmanage.monitor.urls')),
    url(r'^mongodb/', include('dbmanage.mongodb.urls')),
    url(r'^chartapi/', include('dbmanage.chartapi.urls')),
    url(r'^passforget/', include('dbmanage.passforget.urls')),
    url(r'^blacklist/', include('dbmanage.blacklist.urls')),
    url(r'^archer/',include('dbmanage.archer.archer.urls')),
    url(r'^site_media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),



]