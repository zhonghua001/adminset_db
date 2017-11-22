
import pymysql

conf = {
    'user':'root',
    'password':'123456',
    'host':'192.168.0.13',
    'port':6669,
    'db':'d',
    'charset':'utf8'
}

conn = pymysql.connect(**conf)
cur = conn.cursor()

i = range(10000)
p = 1
while True:
    try:
        conn = pymysql.connect(**conf)
        cur = conn.cursor()
        id = i[p]
        num = p + 1
        name = 'test'+str(num)
        sql = "insert into test VALUES ({0},{1},'{2}')".format(id,num,name)
        print(sql)
        cur.execute(sql)
        cur.execute('select *from test where id between 1 and 10')
        data = cur.fetchall()
        print(data)
        p = p+1
        cur.close()
        conn.commit()
        conn.close()
        continue
    except IndexError:
        cur.close()
        conn.commit()
        conn.close()
        break

