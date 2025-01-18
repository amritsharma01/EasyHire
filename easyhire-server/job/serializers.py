# serializers.py
from rest_framework import serializers
from .models import Job,JobApplication

class JobSerializer(serializers.ModelSerializer):
    class Meta:
        model = Job
        fields = ['title', 'description', 'salary','created_at']

class JobApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = JobApplication
        fields = ['job', 'cover_letter']

    def validate(self, attrs):
        # Ensure the user hasn't already applied to this job
        seeker = self.context['request'].user
        job = attrs['job']
        if JobApplication.objects.filter(seeker=seeker, job=job).exists():
            raise serializers.ValidationError("You have already applied for this job.")
        return attrs