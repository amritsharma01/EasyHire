import requests

url = "http://127.0.0.1:8000/api/auth/login/"

data={
    "username": "sharma",
    "password": "11111111"
}

response= requests.post(url, json=data).json()
print(response["access"])
