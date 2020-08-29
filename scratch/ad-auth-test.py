import json
from easyad import EasyAD

# Set up configuration. You could also use a Flask app.config
config = dict(AD_SERVER="192.168.0.238", AD_DOMAIN="spectrum-bd.com")

# Initialize all the things!
ad = EasyAD(config)

# Authenticate a user
username = 'asif'
password = 'Nizhninoor123!'

user = ad.authenticate_user(username, password, json_safe=True)

if user:
    # Successful login! Let's print your details as JSON
    print(json.dumps(user, sort_keys=True, indent=2, ensure_ascii=False))
else:
    print("Those credentials are invalid. Please try again.")
    exit(-1)
