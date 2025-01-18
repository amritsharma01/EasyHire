from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import UserRegistrationSerializer
from rest_framework.permissions import AllowAny,IsAuthenticated

class UserRegistrationView(APIView):
    """
    Handles user registration via POST requests.
    """
    permission_classes=[AllowAny]
    def post(self, request):
        # Validate and save user data
        serializer = UserRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'message': 'User registered successfully'}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
class ProfileView(APIView):
    permission_classes= [IsAuthenticated]
    
    def get(self, request):
        user= request.user
        data={
            "id": user.id,
            "username": user.username,
            "email": user.email,
            "is_employer": user.is_employer,
            "is_job_seeker": user.is_job_seeker
            
        }
        return Response(data=data)
        
