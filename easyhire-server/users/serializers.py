from rest_framework import serializers
from .models import CustomUser

class UserRegistrationSerializer(serializers.ModelSerializer):
    # Fields for input validation
    password = serializers.CharField(write_only=True, required=True, min_length=8)

    class Meta:
        model = CustomUser
        fields = ['username', 'email', 'password', 'is_employer', 'is_job_seeker']

    def create(self, validated_data):
        """
        Overriding the create method to:
        - Hash the password.
        - Assign roles.
        """
        user = CustomUser.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            password=validated_data['password'] 
        )
        user.is_employer = validated_data.get('is_employer', False)
        user.is_job_seeker = validated_data.get('is_job_seeker', True)
        user.save()
        return user
