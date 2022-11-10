from django.db import models

# Create your models here.
class Users(models.Model):
    user_count = models.IntegerField()
    def __str__(self):
        return self.name