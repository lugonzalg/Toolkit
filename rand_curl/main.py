import requests
import random
import time

def test(t):
    url="https://plataforma.ibizasmartisland.com:443/api/v1/$UPS/telemetry"
    myHeaders = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
    }
    val1 = random.randint(0, 1300)
    val2 = random.randint(0, 1000)
    val3 = random.randint(0, 1000)
    send_str = str(val1) + ':' + str(val2) + ':' + str(val3)
    myData = {"data_mydata":send_str}
    response = requests.post(url , headers=myHeaders, json=myData)
    try:
        print(response)
        print(response.status_code)
        print(response.json())
    except Exception as e:
        print(e)

def main():
    while True:
       n = random.randint(0, 100)
       test(n)
       time.sleep(5)

if __name__ == "__main__":
    main()
