import os
from dotenv import load_dotenv
from secure import SecureHeaders, SecureCookie

# Globals
load_dotenv()
secure_headers = SecureHeaders()
secure_cookie = SecureCookie()

# Script
def main():
    print("Hello World Basic setup")

if __name__ == "__main__":
    main()