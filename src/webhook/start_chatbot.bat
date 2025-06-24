@echo off
cd /d D:\xampp\htdocs\Final Deliverable\webhook
start cmd /k "php -S localhost:8000"
start cmd /k "ngrok http 8000"
