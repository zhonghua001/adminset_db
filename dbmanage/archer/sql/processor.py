# -*- coding: UTF-8 -*-
from accounts.models import UserInfo
from .models import sqlreview_role
leftMenuBtnsCommon = (
                   {'key':'allworkflow',        'name':'查看历史工单',     'url':'/dbmanage/archer/allworkflow/',              'class':'glyphicon glyphicon-home'},
                   {'key':'submitsql',          'name':'发起SQL上线',       'url':'/dbmanage/archer/submitsql/',               'class':'glyphicon glyphicon-asterisk'},
               )
leftMenuBtnsSuper = (
                   {'key':'masterconfig',       'name':'主库地址配置',      'url':'/dbmanage/archer/admin/sql/master_config/',      'class':'glyphicon glyphicon-user'},
                   {'key':'userconfig',         'name':'用户权限配置',       'url':'/dbmanage/archer/admin/sql/users/',        'class':'glyphicon glyphicon-th-large'},
                   {'key':'workflowconfig',     'name':'所有工单管理',       'url':'/dbmanage/archer/admin/sql/workflow/',        'class':'glyphicon glyphicon-list-alt'},
)
leftMenuBtnsDoc = (
                   {'key':'dbaprinciples',     'name':'SQL审核必读',       'url':'/dbmanage/archer/dbaprinciples/',        'class':'glyphicon glyphicon-book'},
                   {'key':'charts',     'name':'统计图表展示',       'url':'/dbmanage/archer/charts/',        'class':'glyphicon glyphicon-file'},
)

def global_info(request):
    """存放用户，会话信息等."""
    if request.user.username:
        loginUser = request.user.username
        a = UserInfo.objects.get(username=loginUser)
        if loginUser is not None:
            # user = sqlreview_role.objects.get(userid_id=a.id)
            if a.is_superuser:
                leftMenuBtns = leftMenuBtnsCommon + leftMenuBtnsSuper + leftMenuBtnsDoc
            else:
                leftMenuBtns = leftMenuBtnsCommon + leftMenuBtnsDoc
        else:
            leftMenuBtns = ()

        return {
            'loginUser':loginUser,
            'leftMenuBtns':leftMenuBtns,

        }
    return {}
