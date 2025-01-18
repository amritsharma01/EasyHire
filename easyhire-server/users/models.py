from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class CustomUser(AbstractUser):
    is_employer = models.BooleanField(default=False)
    is_job_seeker= models.BooleanField(default=True)
    

