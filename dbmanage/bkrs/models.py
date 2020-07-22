# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.utils import timezone
from django.db import models

class HOST(models.Model):
    hostname = models.CharField(max_length=50)
    ip = models.GenericIPAddressField()
    port = models.IntegerField()
    user = models.CharField(max_length=50)
    pwd = models.CharField(max_length=200)
    regdate = models.DateTimeField(auto_now_add=timezone.now())
    update = models.DateTimeField(auto_now=timezone.now())
# Create your models here.
    def __unicode__(self):
        return '{hostname}_{ip}_{port}'.format(hostname =self.hostname,ip=self.ip,port=self.port)

class BackupLog(models.Model):
    host = models.ForeignKey(HOST,on_delete=models.SET_NULL,null=True)
    hostname = models.CharField(max_length=50,null=True,db_index=True)
    ip = models.GenericIPAddressField(null=True)
    port = models.IntegerField(null=True)
    type = models.CharField(max_length=50,null=True)
    start_date = models.DateTimeField(null=True)
    finish_date = models.DateTimeField(null=True)
    main_log_file = models.CharField(max_length=50,null=True)
    main_log_pos = models.CharField(max_length=30,null=True)
    backup_local_path = models.CharField(max_length=200, null=True)
    backup_files = models.CharField(max_length=2000,null=True)
    is_tar = models.BooleanField(default=False)
    local_tar_file = models.CharField(max_length=300)
    backup_remote_path = models.CharField(max_length=200,null=True)
    remote_tar_file = models.CharField(max_length=200,null=True)
    verify = models.BooleanField(default=False)
    verify_date = models.DateTimeField(null=True)
    def __unicode__(self):
        return  '{hostname}_{ip}_{port}'.format(hostname=self.hostname if self.hostname is not None else self.host.hostname,
                                                ip=self.ip if self.ip is not None else  self.host.ip,
                                                port=self.port if self.port is not None else self.host.port)

class RestoreLog(models.Model):
    host = models.ForeignKey(HOST, on_delete=models.SET_NULL, null=True)
    hostname = models.CharField(max_length=50, null=True, db_index=True)
    ip = models.GenericIPAddressField(null=True)
    port = models.IntegerField(null=True)
    type = models.CharField(u'Restore type:FULL,INC,BINLOG,DUMP',max_length=50, null=True)
    restore_ip = models.GenericIPAddressField(u'resotre server ip', max_length=30)
    restore_file = models.CharField(u'restore files ', max_length=3000)
    restore_endpos = models.CharField(u'end of resotre datetime or binlog file pos', max_length=300)
    start_date = models.DateTimeField(u'start datetime', auto_created=True)
    end_date = models.DateTimeField(u'start datetime')
    spend_time = models.IntegerField(u'spend time mi')
    local_path = models.CharField(u'local path for backup saved', max_length=500)
    remote_path = models.CharField(u'remote path from  backup saved', max_length=500)
    remote_ip = models.GenericIPAddressField(u'remote storage server ip ', max_length=50)

    def __unicode__(self):
        return  '{hostname}_{ip}_{port}'.format(hostname=self.hostname if self.hostname is not None else self.host.hostname,
                                                ip=self.ip if self.ip is not None else  self.host.ip,
                                                port=self.port if self.port is not None else self.host.port)