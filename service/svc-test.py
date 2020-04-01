#!/usr/bin/python3

import time

while True:
    f = open('/tmp/svc-test.log', 'a', encoding='utf8')
    now = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
    f.write(now+'\n')
    f.close()
    time.sleep(2)