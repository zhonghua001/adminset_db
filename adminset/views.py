#! /usr/bin/env python
# -*- coding: utf-8 -*-
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.core.urlresolvers import reverse
from django.shortcuts import render
from django.shortcuts import redirect
from dbmanage.myapp.models import Db_name
from .form import UpLoad,VerifyUser
import os
def index(request):

    return redirect('/navi/')



@login_required()
def test(request):
    upload=UpLoad()
    user_verify_form = VerifyUser()
    if request.method == 'POST':
        f = VerifyUser(request.POST)

        return render(request,'test.html',{'upload':upload})

    else:
        upfile = UpLoad()
        # return HttpResponseRedirect(reverse('test',args=(4444,66)))
        return render(request,'test.html',{'upload':upfile,'verify_user_form':user_verify_form})