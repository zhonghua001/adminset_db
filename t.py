# -*- coding: utf-8 -*-
import pymysql
def main():
    conf = {
        'user':'root',
        'password':'123456',
        'host':'192.168.134.130',
        'port':3307,
        'db':'mysql',
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

            sql = "select *from mysql.user"


            cur.execute(sql)
            col = [c[0] for c in cur.description]
            result = [dict(zip(col,row)) for row in cur.fetchall()]


            cur.close()
            conn.commit()
            conn.close()
            print result

            continue
        except IndexError:
            cur.close()
            conn.commit()
            conn.close()
            break

if __name__ == '__main__':
    main()