# !/usr/bin/python
# -*- coding: UTF-8 -*-
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
from django.core.mail import send_mail

from dbmanage.archer.sql.sendmail import MailSender

import os,django
os.environ.setdefault('DJANGO_SETTINGS_MODULE','adminset.settings')
django.setup()

from tt.models import *
u=User.objects.get(id=1)
roles = []

for i in u.group_set.all():
    for r in i.role_set.all():
        roles.append(r.role_name)
        print r.role_name

print list(set(roles))
#
s = MailSender()
s.sendEmail('subject','message',['lijd@iccgame.com',])

s.sendEmail('subject','dfdfd',['lijd@iccgame.com'])
# import smtplib
# import email.mime.multipart
# import email.mime.text
#
# msg = email.mime.multipart.MIMEMultipart()
# '''
# 最后终于还是找到解决办法了：邮件主题为‘test’的时候就会出现错误，换成其他词就好了。。我也不知道这是什么奇葩的原因
# '''
# msg['Subject'] = 'duanx'
# msg['From'] = 'ljd8210@163.com'
# msg['To'] = 'lijd@iccgame.com'
# content = '''''
#     你好，xiaoming
#             这是一封自动发送的邮件。
#
#         www.ustchacker.com
# '''
# txt = email.mime.text.MIMEText(content,'plain','utf-8')
# msg.attach(txt)
#
# #smtp = smtplib
# smtp = smtplib.SMTP()
# smtp.connect('smtp.163.com', '25')
# smtp.login('ljd8210@163.com', '2528107752')
# smtp.sendmail('ljd8210@163.com', 'lijd@iccgame.com', msg.as_string())
# smtp.quit()
# print('邮件发送成功email has send out !')
