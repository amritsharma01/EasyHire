from django.urls import path
from job.views import JobPostView, JobListView, EmployerApplicationView, JobApplicationView

urlpatterns = [
   path("post/", JobPostView.as_view(),name="jobpost"),
   path("list/",JobListView.as_view(),name= "joblist"),
   path("apply/", JobApplicationView.as_view(),name="user-applications"),
   path("applications/",EmployerApplicationView.as_view(), name="employer-applications")
]
