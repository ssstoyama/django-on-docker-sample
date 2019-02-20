from django.db import models


class MyModel(models.Model):
    number = models.IntegerField()
    name = models.CharField(max_length=20)