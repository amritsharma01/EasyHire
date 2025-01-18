from django.db import models
from django.contrib.auth import get_user_model


# Create your models here.

class Job(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    salary = models.DecimalField(max_digits=10, decimal_places=2)
    employer = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
    
class JobApplication(models.Model):
    job= models.ForeignKey(Job, on_delete=models.CASCADE, related_name="Applicaiton")
    seeker = models.ForeignKey(get_user_model(), on_delete=models.CASCADE, related_name='applications')
    cover_letter = models.TextField() 
    applied_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('job', 'seeker')  

    def __str__(self):
        return f"{self.seeker.username} applied to {self.job.title}"