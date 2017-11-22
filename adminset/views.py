#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.shortcuts import redirect
from .form import UpLoad
import os
def index(request):

    return redirect('/navi/')

def test(request):
    upload=UpLoad()

    if request.method == 'POST':
        if request.POST.has_key('upload'):

            upload = UpLoad(request.POST,request.FILES)
            if upload.is_valid():
                f = upload.cleaned_data['filename']
                for chunk in f.readlines():
                    print chunk


                result = 'success'

                f1 = request.FILES['filename']
                for i in f1.chunks():
                    print(i)

                return  render (request,'test.html',{'result':result,'upload':result})
        if len(request.POST['text_aaaaaaaa']) ==0:
            return render(request,'test.html',{'upload':upload,'result':'text is empty'})
    else:
        upfile = UpLoad()
        return render(request,'test.html',{'upload':upfile})