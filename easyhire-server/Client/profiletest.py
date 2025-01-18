import requests

url = "http://127.0.0.1:8000/api/auth/profile/"

data={
    "username": "employer",
    "password": "mypassword"
}

headers={
   "Authorization": f"Bearer {"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3MjI2MTQ0LCJpYXQiOjE3MzcyMjU4NDQsImp0aSI6ImJkN2YzNDdlZGUwODRmYTNiMDNiZGM0OWQ0NDFlZWQ3IiwidXNlcl9pZCI6OH0.to7_47mJWbF9XE6wjsY3b79kiMCpzssv7vhV5Oon4MY"}" 
}

response= requests.get(url, headers=headers).json()
print(response)
