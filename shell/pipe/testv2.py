import time, sys

while 1 :
     print('1111')
     sys.stdout.flush()    # 因为是标准输出, 所以直接通过sys的接口去flush
     time.sleep(1)
     print('2222')
     sys.stdout.flush()
     time.sleep(1)