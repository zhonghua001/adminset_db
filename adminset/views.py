#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.shortcuts import redirect
from dbmanage.myapp.models import Db_name
from .form import UpLoad
import os
def index(request):

    return redirect('/navi/')

def test(request):
    upload=UpLoad()
    host = Db_name.objects.filter(account__username=request.user.username).filter(db_account__role__in=['all','admin']).distinct()
    # host = list(host)

    if request.method == 'POST':
        if request.POST.has_key('upload'):

            upload = UpLoad(request.POST,request.FILES)
            if upload.is_valid():
                f = upload.cleaned_data['filename']
                for chunk in f.readlines():
                    print chunk




                f1 = request.FILES['filename']
                for i in f1.chunks():
                    print(i)

        if request.POST.has_key('selected_host'):
            selected_host = request.POST['selected_host']

            result = 'success' if selected_host <> 'select' else 'failed'
            return  render (request,'test.html',{'result':result,'upload':result,'host':host,'selected_host':selected_host})
        if len(request.POST['text_aaaaaaaa']) ==0:
            return render(request,'test.html',{'upload':upload,'result':'text is empty'})
    else:
        upfile = UpLoad()
        return render(request,'test.html',{'upload':upfile,'host':host})