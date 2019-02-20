from django.shortcuts import render

def index(request):
    context = {}
    return render(request, 'myapp/index.html', context)
