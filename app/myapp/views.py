from django.shortcuts import render
from .models import MyModel

def index(request):
    models = MyModel.objects.all()
    context = {'models': models}
    return render(request, 'myapp/index.html', context)
