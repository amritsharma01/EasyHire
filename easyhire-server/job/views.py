from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from users.permissions import IsEmployer, IsJobSeeker
from rest_framework.permissions import IsAuthenticated
from . models import Job, JobApplication
from .serializers import JobApplicationSerializer, JobSerializer
from rest_framework import status, generics
from rest_framework.filters import SearchFilter, OrderingFilter

# Create your views here.
class JobPostView(APIView):
    permission_classes = [IsAuthenticated, IsEmployer]  

    def post(self, request):
        serializer = JobSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(employer=request.user) 
            return Response({"message": "Job posted successfully"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
class JobListView(generics.ListAPIView):
    queryset = Job.objects.all()
    serializer_class = JobSerializer
    # permission_classes = [IsAuthenticated, IsJobSeeker]
    filter_backends = [ SearchFilter, OrderingFilter]
    filterset_fields = ['salary']  # Example: filter by exact salary
    search_fields = ['title', 'description']  # Example: search by keyword
    ordering_fields = ['created_at', 'salary']  
    


class JobApplicationView(APIView):
    """
    Allows job seekers to apply for jobs.
    """
    permission_classes = [IsAuthenticated, IsJobSeeker]

    def post(self, request):
        serializer = JobApplicationSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            serializer.save(seeker=request.user)  # Associate the application with the logged-in user
            return Response({"message": "Application submitted successfully"}, status=201)
        return Response(serializer.errors, status=400)


class EmployerApplicationView(generics.ListAPIView):
    """
    Allows employers to view applications for their job postings.
    """
    permission_classes = [IsAuthenticated, IsEmployer]
    serializer_class= JobApplicationSerializer

    def get_queryset(self):
        # Filter applications for jobs posted by the employer
        return JobApplication.objects.filter(job__employer=self.request.user)