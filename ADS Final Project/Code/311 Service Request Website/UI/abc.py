import urllib2
import json 
import csv
import sys

def main():

    DS_type = sys.argv[1]  #To select which API to Hit as per Building
    page_type = sys.argv[2] # To select CSV operation or input


    if page_type == "CSV":
        listoflists = []
        values = str(sys.argv[3])
        header=  str(sys.argv[4])
        abc = []
        abc.append(values.split(','))

        #print(abc)

        data =  {

            "Inputs": {

                    "Input1":
                    {
                        "ColumnNames" : header.split(','),
                        "Values": abc #values.split(',')
                    },        },
                "GlobalParameters": {
        }
            }

        body = str.encode(json.dumps(data))

     
        url = 'https://ussouthcentral.services.azureml.net/workspaces/607045d56e9b4577abd84aab779dc2eb/services/f086734c58954fa497489e470947eca0/execute?api-version=2.0&details=true'
        #url = 'https://ussouthcentral.services.azureml.net/workspaces/8aba4c4d1e034b56941f1f916e884791/services/5f87bea224a14c1e960d32af6656628d/execute?api-version=2.0&details=true'
        api_key = 'jpXr5v9nZB4X3ErZlIZV2x/y8ZcAgL9LQFSNobOJCKmrU3PsXPIk4aZf9AafAyzWgf+utZv62O1BX6rKJY0mVA=='
        #api_key = 'LZnvjFxHlTdOyAfRr5DimpXaZDWq3J64iIkO+eEFNX88bd956mcCCJsIvJrWr3eKSA+VniEru0IgQ7u9BxuJKw=='
      

        headers = {'Content-Type':'application/json', 'Authorization':('Bearer '+ api_key)}

        req = urllib2.Request(url, body, headers) 

        try:
            response = urllib2.urlopen(req)

        # If you are using Python 3+, replace urllib2 with urllib.request in the above code:
        # req = urllib.request.Request(url, body, headers) 
        # response = urllib.request.urlopen(req)

            result = response.read()
            print(result)
        except urllib2.HTTPError, error:
            print("The request failed with status code: " + str(error.code))

        # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
            print(error.info())

            print(json.loads(error.read()))  
        #return json.loads(error.read())
    else:
        header = sys.argv[3]
        kopi = str(sys.argv[4])
        abc = []
        abc.append(kopi.split(','))
        header = header.split(',')
      
        #print(abc)

        data =  {

            "Inputs": {

                    "Input1":
                    {
                        "ColumnNames" : header,
                        "Values": abc #values.split(',')
                    },        },
                "GlobalParameters": {
        }
            }


        body = str.encode(json.dumps(data))


        url = 'https://ussouthcentral.services.azureml.net/workspaces/607045d56e9b4577abd84aab779dc2eb/services/0c379a065d434cf5b5dd6d1e36c3f7cc/execute?api-version=2.0&details=true'
        #url = 'https://ussouthcentral.services.azureml.net/workspaces/8aba4c4d1e034b56941f1f916e884791/services/5f87bea224a14c1e960d32af6656628d/execute?api-version=2.0&details=true'
        api_key = '4vFDqlsZvTEe3PLFSCyXoXmFs3HmWaIgfD1UzdU/SqC7El5gIyVg4AAIIbhExtRlEd59BQk8bIk5E+i1fS66yA=='
        #api_key = 'LZnvjFxHlTdOyAfRr5DimpXaZDWq3J64iIkO+eEFNX88bd956mcCCJsIvJrWr3eKSA+VniEru0IgQ7u9BxuJKw=='


        headers = {'Content-Type':'application/json', 'Authorization':('Bearer '+ api_key)}

        req = urllib2.Request(url, body, headers) 

        try:
            response = urllib2.urlopen(req)

        # If you are using Python 3+, replace urllib2 with urllib.request in the above code:
        # req = urllib.request.Request(url, body, headers) 
        # response = urllib.request.urlopen(req)

            result = response.read()
            print(result)
        except urllib2.HTTPError, error:
            print("The request failed with status code: " + str(error.code))

        # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
            print(error.info())

            print(json.loads(error.read())) 
        

if __name__ == "__main__":
    main()
    #print('MAIN KE ANDAR')
    
