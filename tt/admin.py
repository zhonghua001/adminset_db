# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from .models import User,Group,Role

class UserAdmin(admin.ModelAdmin):
    list_display = ['username','password','regdate','role_name']

# Register your models here.

admin.site.register(User,UserAdmin)
admin.site.register(Group)
admin.site.register(Role)
