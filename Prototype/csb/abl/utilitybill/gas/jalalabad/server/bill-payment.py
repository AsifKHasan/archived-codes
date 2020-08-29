import web
import json

urls = (
    '/csb/abl/utilitybill/gas/jalalabad/retrieve-ua', 'retrieve_ua',
    '/csb/abl/utilitybill/gas/jalalabad/pay-bill', 'pay_bill'
)

class retrieve_ua:
    def POST(self):
        web.header('Access-Control-Allow-Origin', '*')
        payload = json.loads(web.data())
        
        # simulating backend data/process
        #payload = registration_not(payload)
        #payload = registration_new(payload)
        #payload = registration_byapp(payload)
        payload = registration_byprocess(payload)
        
        return json.dumps(payload)
        
class pay_bill:
    def POST(self):
        web.header('Access-Control-Allow-Origin', '*')
        payload = json.loads(web.data())
        
        # simulating backend data/process
        payload = paybill_ok(payload)
        #payload = paybill_failed(payload)
        
        return json.dumps(payload)
           
# the mobile & account combination was not registered and registration try failed
def registration_not(payload):
    payload["registrationStatus"] = "NotRegistered"
    return payload

# the mobile & account combination was not registered and registration succeeded,
# at this point only mobile & account is in the registration, nothing else
def registration_new(payload):
    payload["registrationStatus"] = "NewRegistration"
    return payload

# the mobile & account combination was registered and name field was found, but was registered through App (thriugh previous bill payment), not by backend process
# this means App can change name and other fields in next request
def registration_byapp(payload):
    payload["registrationStatus"] = "RegisteredByApp"
    payload["name"] = "Asif Hasan"
    return payload

# the mobile & account combination was registered and name field was found, and it was registered through backend process
# this means name and other fields can not be changed from App in subsequent requests
def registration_byprocess(payload):
    payload["registrationStatus"] = "RegisteredByProcess"
    payload["name"] = "Asif Hasan"
    payload["amount"] = "302.00"
    return payload

def paybill_ok(payload):
    payload["paymentStatus"] = "Ok"
    return payload
    
def paybill_failed(payload):
    payload["paymentStatus"] = "Failed"
    return payload

if __name__ == "__main__": 
    app = web.application(urls, globals())
    app.run()