import requests

url = "http://127.0.0.1:8000/api/jobs/list"

data={
    "username": "amrit",
    "password": "1111"
}

headers={
   "Authorization": f"Bearer {"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM2MTQwMTkyLCJpYXQiOjE3MzYxMzk4OTIsImp0aSI6ImFiNjQ2YzhiOGJhMTRmYTFhMjlhNzE5MmJkZGIwMGMxIiwidXNlcl9pZCI6MX0.pteSjImn7w1HLLKpzrHKrU5NgI4_nqn1E0_L1xXQTz0"}" 
}

response= requests.get(url, json=data, headers=headers).json()
print(response)
