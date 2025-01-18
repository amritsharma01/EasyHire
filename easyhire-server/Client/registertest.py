import requests

# URL of the Django registration API
url = "http://127.0.0.1:8000/api/auth/register/"

# Data to be sent in the POST request
data = {
    "username": "employer",
    "email": "employer@example.com",
    "password": "mypassword",
    "is_employer": True,
    "is_job_seeker": False
}

try:
    # Make the POST request
    response = requests.post(url, json=data)

    # Check the response status code
    if response.status_code == 201:
        print("Success:", response.json())
    else:
        print("Failed:", response.json())
except requests.exceptions.RequestException as e:
    print("An error occurred:", str(e))
