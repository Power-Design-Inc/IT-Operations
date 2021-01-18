#!/bin/env python

import requests
import json
import hashlib
import base64
import time
import hmac

#Account Info
AccessId ='48v2wRzfK94y53sq5EuF'
AccessKey ='H_D9i(f5~B^U36^K6i42=^nS~e75gy382Bf6{)P+'
Company = 'api'

#Create list to keep devices
allDevices = []

#Loop through getting all devices
count = 0
done = 0
while done==0:   
    #Request Info
    httpVerb ='GET'
    resourcePath = '/device/devices'
    data=''
    queryParams ='?offset='+str(count)+'&size=10'

    #Construct URL 
    url = 'https://'+ Company +'.logicmonitor.com/santaba/rest' + resourcePath + queryParams

    #Get current time in milliseconds
    epoch = str(int(time.time() * 1000))

    #Concatenate Request details
    requestVars = httpVerb + epoch + data + resourcePath

    #Construct signature
    signature = base64.b64encode(hmac.new(AccessKey,msg=requestVars,digestmod=hashlib.sha256).hexdigest())

    #Construct headers
    auth = 'LMv1 ' + AccessId + ':' + signature + ':' + epoch
    headers = {'Content-Type':'application/json','Authorization':auth}

    #Make request
    response = requests.get(url, data=data, headers=headers)

    #Parse response & total devices returned
    parsed = json.loads(response.content)
    total = parsed['data']['total']
    devices = parsed['data']['items']
    allDevices.append(devices)
    numDevices = len(devices)
    count += numDevices
    if count == total:
        print "done"
        done = 1
    else:
        print "iterating again"

#print all devices
print json.dumps(allDevices, indent=5, sort_keys=True)