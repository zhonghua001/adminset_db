from django.db import models

from django.conf import settings




# Create your models here.
class Tb_blacklist(models.Model):
    dbtag = models.CharField(max_length=255,unique=True)
    tbname = models.TextField(max_length=255)
    user_permit = models.ManyToManyField(settings.AUTH_USER_MODEL)
    def __unicode__(self):
        return self.dbtag
    class Meta:
        db_table = 'tb_blacklist'