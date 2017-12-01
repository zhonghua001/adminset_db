# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.utils import timezone
from datetime import datetime


class UserManager(models.Manager):
    def get_user_gr(self, user):
        from django.db import connection
        with  connection.cursor() as cursor:
            sql = '''SELECT role_name ,group_name FROM tt_group t1 join
                      tt_group_user t2 ON t1.id=t2.group_id
                      JOIN tt_user t3 ON t3.id=t2.user_id
                      JOIN tt_role_group t4 ON t4.group_id=t1.id
                      JOIN tt_role t5 ON t4.role_id = t5.id
                      WHERE t3.username=%s
                      '''
            cursor.execute(sql,user)
            result = []
            for r in cursor.fetchall():
                p = {'role_name':r[0],'group_name':r[1]}
                result.append(p)

            return result




class User(models.Model):
    username = models.CharField(max_length=50)
    password = models.CharField(max_length=50)
    regdate = models.DateTimeField(auto_now_add=timezone.now())

    objects = UserManager()

    def __unicode__(self):
        return self.username

    def user_regdate_status(self):
        if self.regdate < datetime.date(2017,11,24):
            return 'Before publish product '
    @property
    def full_name(self):
        return '{} {}'.format(self.username,self.regdate)

    @property
    def role_name(self):

        roles = []
        for i in self.group_set.all():
            for r in i.role_set.all():
                roles.append(r.role_name)
                print r.role_name

        return ','.join(list(set(roles)))



class Group(models.Model):

    group_name = models.CharField(max_length=50)
    user = models.ManyToManyField(User)

    def __unicode__(self):
        return '{group_name}'.format(group_name=self.group_name)

class Role(models.Model):
    role_name = models.CharField(max_length=50)
    group = models.ManyToManyField(Group)

    def __unicode__(self):

        return '{role_name}'.format(role_name=self.role_name)






# Create your models here.
