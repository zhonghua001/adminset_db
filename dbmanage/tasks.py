from celery import shared_task

@shared_task()
def db(x,y):
    for i in range(x):
        
        print(i)
        if i == y:
            return 1