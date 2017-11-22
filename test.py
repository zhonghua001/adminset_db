<<<<<<< HEAD
# -*- coding: utf8 -*-
import os

import datetime
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "adminset.settings")
import time


from django.utils import timezone

print(timezone.now())

ss = '2017-01-01 15:00:00'





print datetime.datetime.strptime(ss,'%Y-%m-%d %H:%M:%S')


print timezone.make_aware(datetime.datetime.strptime(ss,'%Y-%m-%d %H:%M:%S'))


datetime.datetime.fromtimestamp(timezone.make_aware(datetime.datetime.strptime(ss,'%Y-%m-%d %H:%M:%S'))).replace(tzinfo=utc)

# navie = timezone.now()
#
# aware = timezone.now()
#
# print (timezone.is_naive(navie),navie.tzinfo)
# print(timezone.is_aware(aware),aware.tzinfo)
#
# print timezone.localtime(aware).tzinfo

=======
#!/usr/bin/python
#-\*-coding: utf-8-\*-

import pymysql
pymysql.install_as_MySQLdb()
sql='''/*--user=root;--password=123456;--host=192.168.0.13;--enable-check;--port=3306;*/\
inception_magic_start;\
use test;\
CREATE TABLE adaptive_office(id int);' \
    'insert into t values(1,'32',now()); \
insert into t values(2,'32',now()); \
insert into t values(3,'32',now()); \
insert into t values(4,'32',now());\
inception_magic_commit;'''
try:
    conn=pymysql.connect(host='192.168.0.13',user='',passwd='',db='',port=6669)
    cur=conn.cursor()
    ret=cur.execute(sql)
    result=cur.fetchall()
    num_fields = len(cur.description)
    field_names = [i[0] for i in cur.description]
    print field_names
    for row in result:
        print row[0], "|",row[1],"|",row[2],"|",row[3],"|",row[4],"|",
        row[5],"|",row[6],"|",row[7],"|",row[8],"|",row[9],"|",row[10]
    cur.close()
    conn.close()
except pymysql.Error,e:
     print "Mysql Error %d: %s" % (e.args[0], e.args[1])
>>>>>>> eadfb98d8ea1357dfc5f99cc4c2b97410d74eb16
