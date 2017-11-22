
from django import forms

class VerifyHostnameIp(forms.Form):
    hostname = forms.CharField()
    ip = forms.CharField()
