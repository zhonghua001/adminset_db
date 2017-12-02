#! /usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render,HttpResponse
from django.http import HttpResponseForbidden
from accounts.models import UserInfo
from cmdb.models import Host
from django.template.loader import render_to_string
from django.http import JsonResponse
from django.shortcuts import redirect
from dbmanage.myapp.models import Db_name
from .form import UpLoad
import os
import json

def index(request):

    return redirect('/navi/')



def test(request):
    upload=UpLoad()
    host = Db_name.objects.filter(account__username=request.user.username).filter(db_account__role__in=['all','admin']).distinct()
    # host = list(host)
    result = 'success'

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
        # context = {'t1':'fdsfds','t2':'erfefefe'}
        # static_html = '/tmp/static.html'
        # if not os.path.exists(static_html):
        #     content = render_to_string('template.html',context)
        #     with open(static_html,'w') as static_file:
        #         static_file.write(content)

        # return render(request,static_html)



        upfile = UpLoad()
        return render(request,'test.html',{'upload':upfile,'host':host,'result':json.dumps(result)})



def add(request):
    a = request.GET.get('a')
    b = request.GET.get('b')
    result = int(a) + int(b)

    return HttpResponse(result)

def ajax_dict(request):
    u = UserInfo.objects.get(id=1)
    result = {}
    result['username'] = u.username
    result['password'] = u.password
    result['is_active'] = u.is_active
    return JsonResponse(result)


def ajax_list(request):
    h = Host.objects.all()
    list =[]
    for i in h:
        list.append(i.hostname)

    return JsonResponse(list,safe=False)


def forbidden(request):
    f = '<h1>Forbidden!</h1>'
    return HttpResponseForbidden(f)

