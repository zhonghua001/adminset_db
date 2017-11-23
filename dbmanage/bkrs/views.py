#! /usr/bin/env python
# -*- coding: utf-8 -*-
from django.shortcuts import render, HttpResponse
import ConfigParser
from cmdb.models import HostGroup,Host
import os
from django.middleware import csrf
from django.contrib.auth.decorators import login_required
from accounts.permission import permission_verify
from django.contrib.auth import get_user_model
from lib.log import dic
import json




@login_required()
@permission_verify()
def index(request):
    '''
    [04/Nov/2017 21:22:01] "GET /dbmanage/?
    csrfmiddlewaretoken=AGmegYcTyfSVvXHZ5TpXLM44ToAuvCphfHyXgx91cCfXWF8gEnimyt8wRzCtkRbV
    &group=1
    &host=0 
    HTTP/1.1" 200 11575
    :param request: 
    :return: 
    '''
    temp_name = 'dbmanage/dbmanage_header.html'
    select_group_id=request.GET.get('group')
    select_host_id = request.GET.get('host')
    group = HostGroup.objects.all()
    group_list = []
    host_list = []
    for g in group:
        group_list.append({'group_id': g.id, 'group_name': g.name})
    if select_group_id is None:
        select_group_id = 0
    if int(select_group_id) > 0:
        selected_group_name = HostGroup.objects.values('name').filter(id=select_group_id)[0]['name']

        h = Host.objects.values('id','hostname','ip').filter(group=int(select_group_id)).order_by('hostname')
        for hi in h:
            host_list.append({'host_id':hi['id'],'hostname':hi['hostname'],'host_ip':hi['ip']})

    return render(request,'dbmanage/index.html',locals())

@login_required()
@permission_verify()
def edit_conf(request):
    if request.GET.get('host') > 0:
        host_id = request.GET.get('host')

        if host_id:
            hostname,host_ip = Host.objects.values_list('hostname','ip').get(id=host_id)

            temp_name = "dbmanage/dbmanage_header.html"
            display_control = "True"
            dirs = os.path.dirname(os.path.abspath(__file__))
            config = ConfigParser.ConfigParser()
            all_level = dic
            configfile = dirs+'/conf/base.conf'
            f = dirs+'/conf/{hostname}_{ip}.conf'.format(hostname=hostname,ip='_'.join(host_ip.split('.')))
            configfile_exists = 0
            if os.path.isfile(f):
                configfile = f
                configfile_exists =1

            select_group_id = request.GET.get('group')
            select_host_id = request.GET.get('host')
            group = HostGroup.objects.all()
            group_list = []
            host_list = []
            for g in group:
                group_list.append({'group_id': g.id, 'group_name': g.name})
            if select_group_id is None:
                select_group_id = 0
            if int(select_group_id) > 0:
                selected_group_name = HostGroup.objects.values('name').filter(id=select_group_id)[0]['name']

                h = Host.objects.values('id', 'hostname', 'ip').filter(group=int(select_group_id)).order_by('hostname')
                for hi in h:
                    host_list.append({'host_id': hi['id'], 'hostname': hi['hostname'], 'host_ip': hi['ip']})

                if int(select_host_id) > 0:
                    for l in host_list:
                        if l['host_id'] == int(select_host_id):
                            selected_hostname = l['hostname']


            with open(configfile, 'r') as cfgfile:
                config.readfp(cfgfile)

                xbs_decrypt = config.get('Xbstream', 'xbs_decrypt')
                xbstream = config.get('Xbstream', 'xbstream')
                remote_stream = config.get('Xbstream', 'remote_stream')
                xbstream_options = config.get('Xbstream', 'xbstream_options')
                stream = config.get('Xbstream', 'stream')
                remote_dir = config.get('Remote', 'remote_dir')
                remote_conn = config.get('Remote', 'remote_conn')
                remove_original = config.get('Compress', 'remove_original')
                compress = config.get('Compress', 'compress')
                compress_chunk_size = config.get('Compress', 'compress_chunk_size')
                compress_threads = config.get('Compress', 'compress_threads')
                decompress = config.get('Compress', 'decompress')
                chown_command = config.get('Commands', 'chown_command')
                start_mysql_command = config.get('Commands', 'start_mysql_command')
                stop_mysql_command = config.get('Commands', 'stop_mysql_command')
                mysql_password = config.get('MySQL', 'mysql_password')
                mysql_host = config.get('MySQL', 'mysql_host')
                datadir = config.get('MySQL', 'datadir')
                mycnf = config.get('MySQL', 'mycnf')
                mysql_socket = config.get('MySQL', 'mysql_socket')
                mysqladmin = config.get('MySQL', 'mysqladmin')
                mysql_user = config.get('MySQL', 'mysql_user')
                mysql_port = config.get('MySQL', 'mysql_port')
                mysql = config.get('MySQL', 'mysql')
                encrypt = config.get('Encrypt', 'encrypt')
                xbcrypt = config.get('Encrypt', 'xbcrypt')
                encrypt_key = config.get('Encrypt', 'encrypt_key')
                remove_original = config.get('Encrypt', 'remove_original')
                decrypt = config.get('Encrypt', 'decrypt')
                encrypt_chunk_size = config.get('Encrypt', 'encrypt_chunk_size')
                encrypt_threads = config.get('Encrypt', 'encrypt_threads')
                encrypt_key_file = config.get('Encrypt', 'encrypt_key_file')
                xtra_prepare_options = config.get('Backup', 'xtra_prepare_options')
                backup_tool = config.get('Backup', 'backup_tool')
                archive_dir = config.get('Backup', 'archive_dir')
                prepare_tool = config.get('Backup', 'prepare_tool')
                pid_dir = config.get('Backup', 'pid_dir')
                full_backup_interval = config.get('Backup', 'full_backup_interval')
                max_archive_size = config.get('Backup', 'max_archive_size')
                xtra_prepare = config.get('Backup', 'xtra_prepare')
                xtra_options = config.get('Backup', 'xtra_options')
                tmpdir = config.get('Backup', 'tmpdir')
                partial_list = config.get('Backup', 'partial_list')
                xtra_backup = config.get('Backup', 'xtra_backup')
                max_archive_duration = config.get('Backup', 'max_archive_duration')
                pid_runtime_warning = config.get('Backup', 'pid_runtime_warning')
                optional = config.get('Backup', 'optional')
                backupdir = config.get('Backup', 'backupdir')
                gitcmd = config.get('TestConf', 'gitcmd')
                mysql_options = config.get('TestConf', 'mysql_options')
                ps_branches = config.get('TestConf', 'ps_branches')
                xb_configs = config.get('TestConf', 'xb_configs')
                testpath = config.get('TestConf', 'testpath')
                incremental_count = config.get('TestConf', 'incremental_count')

            cfgfile.close()
            # return HttpResponse('success')
            return render(request, 'dbmanage/edit.html',locals())
    else:
        return render(request,'dbmanage/index.html',locals())


@login_required()
@permission_verify()
def config_save(request):
    temp_name = "config/config-header.html"
    if request.method == 'POST':
        # path info
        ansible_path = request.POST.get('ansible_path')
        roles_path = request.POST.get('roles_path')
        pbook_path = request.POST.get('pbook_path')
        scripts_path = request.POST.get('scripts_path')
        # db info
        engine = request.POST.get('engine')
        host = request.POST.get('host')
        port = request.POST.get('port')
        user = request.POST.get('user')
        password = request.POST.get('password')
        database = request.POST.get('database')
        # cmdb_api_token
        token = request.POST.get('token')
        ssh_pwd = request.POST.get('ssh_pwd')
        # log info
        log_path = request.POST.get('log_path')
        log_level = request.POST.get('log_level')
        # mongodb info
        mongodb_ip = request.POST.get('mongodb_ip')
        mongodb_port = request.POST.get('mongodb_port')
        mongodb_user = request.POST.get('mongodb_user')
        mongodb_pwd = request.POST.get('mongodb_pwd')
        mongodb_collection = request.POST.get('mongodb_collection')
        # webssh domain
        webssh_domain = request.POST.get('webssh_domain')

        config = ConfigParser.RawConfigParser()
        dirs = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        config.add_section('config')
        config.set('config', 'ansible_path', ansible_path)
        config.set('config', 'roles_path', roles_path)
        config.set('config', 'playbook_path', pbook_path)
        config.set('config', 'scripts_path', scripts_path)
        config.add_section('db')
        config.set('db', 'engine', engine)
        config.set('db', 'host', host)
        config.set('db', 'port', port)
        config.set('db', 'user', user)
        config.set('db', 'password', password)
        config.set('db', 'database', database)
        config.add_section('token')
        config.set('token', 'token', token)
        config.set('token', 'ssh_pwd', token)
        config.add_section('log')
        config.set('log', 'log_path', log_path)
        config.set('log', 'log_level', log_level)
        config.add_section('mongodb')
        config.set('mongodb', 'mongodb_ip', mongodb_ip)
        config.set('mongodb', 'mongodb_port', mongodb_port)
        config.set('mongodb', 'mongodb_user', mongodb_user)
        config.set('mongodb', 'mongodb_pwd', mongodb_pwd)
        config.set('mongodb', 'collection', mongodb_collection)
        config.add_section('webssh')
        config.set('webssh', 'domain', webssh_domain)
        tips = u"保存成功！"
        display_control = ""
        with open(dirs+'/adminset.conf', 'wb') as cfgfile:
            config.write(cfgfile)
        with open(dirs+'/adminset.conf', 'r') as cfgfile:
            config.readfp(cfgfile)
            a_path = config.get('config', 'ansible_path')
            r_path = config.get('config', 'roles_path')
            p_path = config.get('config', 'playbook_path')
            s_path = config.get('config', 'scripts_path')
            engine = config.get('db', 'engine')
            host = config.get('db', 'host')
            port = config.get('db', 'port')
            user = config.get('db', 'user')
            password = config.get('db', 'password')
            database = config.get('db', 'database')
            token = config.get('token', 'token')
            ssh_pwd = config.get('token', 'ssh_pwd')
            log_path = config.get('log', 'log_path')
            mongodb_ip = config.get('mongodb', 'mongodb_ip')
            mongodb_port = config.get('mongodb', 'mongodb_port')
            mongodb_user = config.get('mongodb', 'mongodb_user')
            mongodb_pwd = config.get('mongodb', 'mongodb_pwd')
            mongodb_collection = config.get('mongodb', 'collection')
            webssh_domain = config.get('webssh', 'domain')
    else:
        display_control = "none"
    return render(request, 'config/index.html', locals())


def get_dir(args):
    config = ConfigParser.RawConfigParser()
    dirs = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    with open(dirs+'/adminset.conf', 'r') as cfgfile:
        config.readfp(cfgfile)
        a_path = config.get('config', 'ansible_path')
        r_path = config.get('config', 'roles_path')
        p_path = config.get('config', 'playbook_path')
        s_path = config.get('config', 'scripts_path')
        token = config.get('token', 'token')
        ssh_pwd = config.get('token', 'ssh_pwd')
        log_path = config.get('log', 'log_path')
        log_level = config.get('log', 'log_level')
        mongodb_ip = config.get('mongodb', 'mongodb_ip')
        mongodb_port = config.get('mongodb', 'mongodb_port')
        mongodb_user = config.get('mongodb', 'mongodb_user')
        mongodb_pwd = config.get('mongodb', 'mongodb_pwd')
        mongodb_collection = config.get('mongodb', 'collection')
        webssh_domain = config.get('webssh', 'domain')
    # 根据传入参数返回变量以获取配置，返回变量名与参数名相同
    if args:
        return vars()[args]
    else:
        return HttpResponse(status=403)


@login_required()
@permission_verify()
def get_token(request):
    if request.method == 'POST':
        new_token = get_user_model().objects.make_random_password(length=12, allowed_chars='abcdefghjklmnpqrstuvwxyABCDEFGHJKLMNPQRSTUVWXY3456789')
        return HttpResponse(new_token)
    else:
        return True
