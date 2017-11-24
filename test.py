import os,django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','adminset.settings')
django.setup()

from django.db import models

# #
# # class Question(models.Model):
# #     question_text = models.CharField(max_length=200)
# #     pub_date = models.DateTimeField('date published')
# #
# #
# # class Choice(models.Model):
# #     question = models.ForeignKey(Question, on_delete=models.CASCADE)
# #     choice_text = models.CharField(max_length=200)
# #     votes = models.IntegerField(default=0)
#
#
#
# from django.shortcuts import get_object_or_404
# from dbmanage.archer.sql.models import sqlreview_role
# from accounts.models import UserInfo
# from dbmanage.myapp.models import Db_name,Db_account,Db_group,Db_instance
#
# a = get_object_or_404(sqlreview_role,pk=2)
# u = get_object_or_404(UserInfo,username='zhonghua001')
#
# d = get_object_or_404(Db_name,pk=2)
#
# ss = d.db_account_set.all()
#
# print u.db_account_set.all()


import os,django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','adminset.settings')
django.setup()

from tt.models import *
User.objects.get_user_gr(user='uu1')