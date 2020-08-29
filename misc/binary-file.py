# %%
from pathlib import Path
import binascii
from Crypto.PublicKey import RSA
from base64 import b64decode
from base64 import b64encode

publicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhSO2mh+ql9fA850zd4WiMprQfY4l+Rtvo+yVkxKGVGX8028uBB8/TFIv4gDZSGTp36DJNSQ+U27eXOXeB3mMRry66Nn/+TPo3q/+k2Vkk+kBiWsXBVv9FWN94PRnD2dsTlVOuqWTPyF11D8Pwbma5oLymTY4bSqJoAwNB1Fvhuw5a616HPUeP/heACrmmomXv+oyOYbgTfjxixkhOh5NCjGZmhk8tgITy+f7tpWzjr2EsG0MlUbhlm5u+iUzH+9DwdodK04F46QdjeBRcnePdTFYbZQZ6GBLveLp7yb4YxFAFq5XcK5knvFWjROaHWtHUzS2fnsr5yp+lfVEoIMgxwIDAQAB'

# %%
data = Path('C:/Users/HP/Downloads/Microsoft.SkypeApp_kzf8qxf38zg5c!App/All/smartguide.lic').read_bytes()
#print(binascii.hexlify(data))

# %%
keyDER = b64decode(publicKey)
keyPub = RSA.importKey(keyDER)
