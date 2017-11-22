from django import forms

class UpLoad(forms.Form):
    filename = forms.FileField()