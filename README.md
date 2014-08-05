pdfdownloader
=============

Simple Sinatra app used to convert and download HTML pages as PDF

Before deploy, set the env vars ```PDFUSERNAME``` and ```PDFPASSWD```. They will be used on Basic HTTP Authentication.

Once deployed, you can just send a post request to ```/``` sending the parameters ```file_name``` - which is the desired name of the PDF file to generate - and ```url``` - the public url that should be used to generate the file.
