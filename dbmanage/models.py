# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class DBConfigInfo(models.Model):
    hostname = models.CharField(u'hostname',max_length=50,unique=True)
    ip = models.GenericIPAddressField(u'ip')
    comment = models.CharField(u'comments',max_length=200)
    backup_config = models.TextField('')
    regdate = models.DateTimeField('增更加或者改日期')

    def __unicode__(self):
        return  self.hostname

class BackupLog(models.Model):
    BACKUP_TYPE=(
          ('F',u'FULL'),
          ('I',u'INC'),
          ('B',u'BINLOG'),
          ('D','DUMP')
      )
    hostname = models.CharField(max_length=50)
    ip = models.GenericIPAddressField()
    type = models.CharField(u'bakcup type:FULL,INC,BINLOG,DUMP',max_length=10,choices=BACKUP_TYPE)
    start_date = models.DateTimeField(u'start datetime',auto_created=True)
    end_date = models.DateTimeField(u'start datetime')
    spend_time = models.IntegerField(u'spend time mi')
    local_path = models.CharField(u'local path for backup saved',max_length=500)
    remote_path = models.CharField(u'local path for backup saved',max_length=500)
    is_copy_to_remote = models.IntegerField(u'flag scp backupfile to remote,0:NO,1:YES',null=True)
    copy_date = models.DateTimeField(u'datetime to copy backupfile ',null=True)
    remote_ip = models.GenericIPAddressField(u'remote storage server ip ',max_length=50)

    def __unicode__(self):
        return self.hostname

class RestoreLog(models.Model):
    hostname = models.CharField(max_length=50)
    ip = models.GenericIPAddressField()
    type = models.CharField(u'Restore type:FULL,INC,BINLOG,DUMP', max_length=100)
    restore_ip = models.GenericIPAddressField(u'resotre server ip',max_length=30)
    restore_file = models.CharField(u'restore files ',max_length=3000)
    restore_endpos = models.CharField(u'end of resotre datetime or binlog file pos',max_length=300)
    start_date = models.DateTimeField(u'start datetime', auto_created=True)
    end_date = models.DateTimeField(u'start datetime')
    spend_time = models.IntegerField(u'spend time mi')
    local_path = models.CharField(u'local path for backup saved', max_length=500)
    remote_path = models.CharField(u'local path for backup saved', max_length=500)
    remote_ip = models.GenericIPAddressField(u'remote storage server ip ', max_length=50)

    def __unicode__(self):
        return self.hostname

