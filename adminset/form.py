from django import forms
import datetime

class UpLoad(forms.Form):
    filename = forms.FileField()


class VerifyUser(forms.Form):
    useranme = forms.CharField(label='Your UserName:',max_length=50,min_length=10,help_text='please input your username')
    password = forms.CharField(label='Your Password',max_length=50)
    email = forms.EmailField(label='Your Email:',max_length=50)
    address = forms.CharField(max_length=50)
    date = forms.DateTimeField(initial=datetime.datetime.now())
