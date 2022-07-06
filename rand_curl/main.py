import requests
import random
import time

def test(t):
    print(t)
    headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
    }
    data = {"Amp_hour":t}
    response = requests.post('http://212.227.169.80:8080/api/v1/174d5c06a6159b222154/telemetry', headers=headers, json=data)    
    print(response)
    print(response.status_code)

def main():
    while True:
       n = random.randint(0, 100) 
       test(n)
       time.sleep(1)

if __name__ == "__main__":
    main()
