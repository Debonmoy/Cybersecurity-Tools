
from Cryptodome.Cipher import   AES

def make_text(data):
    new_data=data+(16-len(data)%16*' ')
    return(new_data)

key=220
key=make_text(key).encode('UTF-8')

text='I am a good boy'
text=make_text(text).encode('UTF-8')

en= AES.new(key, AES.MODE_CBC)
encrypted_text=en.encrypt(text)

