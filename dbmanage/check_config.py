# -*- coding: utf-8 -*-

import sys,os
import ansible

import ConfigParser

class CheckConfigFile():
    def __init__(self,hostname,ip):
        self.hostname = hostname
        self.ip = ip

        self.BASE_DIR = os.path.dirname(os.path.abspath(__file__))
        self.CONF_DIR = os.path.join(self.BASE_DIR,'conf')
        self.conf = ConfigParser.ConfigParser()
        self.split_ip = '_'.join(self.ip.split('.'))
    def read_conf(self,hostname=None,ip=None):
        conf_json = {}
        if hostname is not None and ip is not None:
            config_file = '{0}/{1}_{2}.conf'.format(self.CONF_DIR,self.hostname,self.split_ip)
        else:
            config_file ='{0}/{1}.conf'.format(self.CONF_DIR,'base')
        conf = ConfigParser.ConfigParser()

        if os.path.isfile(config_file):
            conf.read(config_file)
            for section in conf.sections():
                if type(section) == 'unicode':
                    section = section.encode()
                conf_json[section.encode()] = {}
                for key ,value in conf.items(section):
                    conf_json[section.decode()][key.encode()] = value.encode()

            return conf_json
        else:
            return None



    def write_conf(self,conf):
        '''
        conf must be a json data
        conf = 
          {'Mysql':{'host':'127.0.0.1','password':'123456'},
         'Backup':{'backup_path':'/backup'}
         }
    
            print(a['Mysql'].items())
            :param conf: 
            :return: 
        '''
        config_file = '{0}/{1}_{2}.conf'.format(self.CONF_DIR, self.hostname, self.split_ip)
        f = open(config_file,'w')
        config_write = ConfigParser.RawConfigParser()
        for section in conf.keys():
            config_write.add_section(section)
            for key,value in conf[section].items():
                config_write.set(section,key,value)

        f.close()



if __name__ == '__main__':
    c = CheckConfigFile('hdp-manager','192.168.15.158')
    c.read_conf('hdp-manager','192.168.15.158')

    html = '''<div class="form-group">
                  <label for="{0}" class="col-sm-2 control-label">{0}:</label>

                  <div class="col-sm-10">
                      <input type="text" value="{{ {0} }}" id="{0}" name="{0}" style="width:450px;">
                  </div>
                </div>'''
    d = c.read_conf()
    print()
    for i in d.keys():
        print('{}------------------------------------'.format(i))
        for key in d[i].keys():
            print(i,key)

