import requests

url = "https://172.27.1.157/rest/com/vmware/cis/session"

payload = {}
files = {}
headers = {
    'Authorization': 'Basic c2VydmljZUB2c3BoZXJlLmxvY2FsOmE0N1d6M2F4a0FCNiozOFBudnlt',
    'Cookie': 'vmware-api-session-id=222cee7c16b6135d0a017b217fd4fac8'
}

response = requests.request(
    "POST", url, headers=headers, data=payload, files=files)

print(response.text)
