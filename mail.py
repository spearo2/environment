#!/usr/bin/env python3
from getpass import getpass
import sys
import psutil
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import base64
import os
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.fernet import Fernet

def generate_key_from_passphrase(passphrase):
    kdf = PBKDF2HMAC(
        algorithm=hashes.SHA256(),
        length=32,
        salt=b"",
        iterations=100000,
    )
    key = base64.urlsafe_b64encode(kdf.derive(passphrase.encode()))
    return key

def encrypt_string(key, string_to_encrypt):
    fernet = Fernet(key)
    encrypted_string = fernet.encrypt(string_to_encrypt.encode())
    return encrypted_string

def decrypt_string(key, encrypted_string):
    fernet = Fernet(key)
    decrypted_string = fernet.decrypt(encrypted_string).decode()
    return decrypted_string

def usage():
    print(f"Usage: {sys.argv[0]} <pid> <from_email> <to_email>")

def send_email(subject, body, to_email, from_email, smtp_server, smtp_port, smtp_user, smtp_password):
    msg = MIMEMultipart()
    msg['From'] = from_email
    msg['To'] = to_email
    msg['Subject'] = subject

    msg.attach(MIMEText(body, 'Experiment has finished'))

    try:
        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()
        server.login(smtp_user, smtp_password)
        text = msg.as_string()
        server.sendmail(from_email, to_email, text)
        server.quit()
        print("Email sent successfully")
    except Exception as e:
        print(f"Failed to send email: {e}")

def check_process_and_notify(pid, to_email, from_email, smtp_server, smtp_port, smtp_user, smtp_password):
    try:
        process = psutil.Process(pid)
        process.wait()  # This will block until the process terminates
        subject = f"Process {pid} has finished"
        body = f"The process with PID {pid} has finished execution."
        send_email(subject, body, to_email, from_email, smtp_server, smtp_port, smtp_user, smtp_password)
    except psutil.NoSuchProcess:
        print(f"No process found with PID {pid}")

if __name__ == "__main__":
    if len(sys.argv) != 4:
        usage()
        sys.exit(1)
    if not sys.argv[1].isdigit():
        print("PID must be a number")
        usage()
        sys.exit(1)
    pid = int(sys.argv[1])
    from_email = sys.argv[2]
    to_email = sys.argv[3]
    smtp_server = "smtp.gmail.com"
    smtp_port = 587
    smtp_user = from_email
    key = getpass("Enter your password: ")
    key = generate_key_from_passphrase(key)
    with open('password', 'rb') as file:
        encrypted = file.read()
    smtp_password = decrypt_string(key, encrypted)
    check_process_and_notify(pid, to_email, from_email, smtp_server, smtp_port, smtp_user, smtp_password)
