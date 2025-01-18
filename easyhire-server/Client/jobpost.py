import requests

url = "http://127.0.0.1:8000/api/jobs/post/"

data={
    "title": "Software Engineer 2",
    "description": "Looking for a skilled Python developer.",
    "salary": "75000.00"
}


headers={
   "Authorization": f"Bearer {'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM2MDcxMjEyLCJpYXQiOjE3MzYwNzA5MTIsImp0aSI6ImU1NThkMjVhMTkxMzRkMDhiZjg3YWExMDA1YWMxYmFlIiwidXNlcl9pZCI6M30.5SWeI6v1nmYRdJcGByHIcBx4MO-vPXx009rb7WuLrA0'}"
}

try:
    # Make the POST request
    response = requests.post(url, json=data, headers=headers)

    # Check the response status code
    if response.status_code == 201:
        print("Success:", response.json())
    else:
        print("Failed:", response.json())
except requests.exceptions.RequestException as e:
    print("An error occurred:", str(e))
