from django.contrib.auth.decorators import login_required, permission_required
from accounts.permission import permission_verify
from accounts.models import UserInfo
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.http import HttpResponseRedirect
from django.shortcuts import render

from dbmanage.blacklist.models import Tb_blacklist
from dbmanage.myapp.etc.config import public_user
from dbmanage.myapp.models import Db_name


# Create your views here.

@login_required(login_url='/accounts/login/')
# @permission_required('myapp.can_set_pri', login_url='/')
@permission_verify()
def blist(request):
    temp_name = 'dbmanage/dbmanage_header.html'
    page_size = 10
    all_record = Tb_blacklist.objects.all().order_by('id')
    paginator = Paginator(all_record, page_size)
    try:
        page = int(request.GET.get('page', 1))
    except ValueError:
        page = 1
    try:
        posts = paginator.page(page)
    except (EmptyPage, InvalidPage):
        posts = paginator.page(paginator.num_pages)
    return render(request, 'blist.html', locals())

@login_required(login_url='/accounts/login/')
# @permission_required('myapp.can_set_pri', login_url='/')
@permission_verify()
def bl_delete(request):
    temp_name = 'dbmanage/dbmanage_header.html'
    try:
        myid = int(request.GET['dbid'])
        db = Tb_blacklist.objects.get(id=myid)
        db.delete()
    except:
        pass
    finally:
        return HttpResponseRedirect("/blacklist/blist/")

@login_required(login_url='/accounts/login/')
# @permission_required('myapp.can_set_pri', login_url='/')
@permission_verify()
def bl_edit(request):
    temp_name = 'dbmanage/dbmanage_header.html'
    userlist = UserInfo.objects.exclude(username=public_user).all().order_by('username')
    if request.method == 'GET':
        try:
            myid = int(request.GET['dbid'])
            edit_db = Tb_blacklist.objects.get(id=myid)
        except:
            pass
    elif request.method == 'POST':
        try:
            info = "set ok"
            if request.POST.has_key('set'):
                myid = int(request.POST['set'])
                edit_db = Tb_blacklist.objects.get(id=myid)
                dbtag = request.POST['setdbtag'][:30]
                if Tb_blacklist.objects.filter(dbtag=dbtag).exclude(id=myid).all()[:1]:
                    info = "this dbtag already settled"
                    return render(request, 'bl_edit.html', locals())
                edit_db.dbtag = dbtag
                edit_db.tbname = request.POST['settbname'][:300]

                for i in edit_db.user_permit.all():
                    edit_db.user_permit.remove(i)
                for i in UserInfo.objects.filter(username__in=request.POST.getlist('choose_user')).all():
                    edit_db.user_permit.add(i)
                edit_db.save()
            elif request.POST.has_key('create'):
                dbtag = request.POST['setdbtag']
                if not Db_name.objects.filter(dbtag=dbtag).all()[:1]:
                    info = "dbtag not exists"
                    return render(request, 'bl_edit.html', locals())
                edit_db = Tb_blacklist(dbtag=dbtag,tbname=request.POST['settbname'][:300])
                edit_db.save()
                for i in UserInfo.objects.filter(username__in=request.POST.getlist('choose_user')).all():
                    edit_db.user_permit.add(i)
                edit_db.save()

        except Exception,e:
            print e
            info = "set failed"
    return render(request, 'bl_edit.html', locals())