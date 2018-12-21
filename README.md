# rtgg_ext

rtgg_ext is a script for extracting plain text from PDF files Royal Thai Government Gazette. This project was started Artit Suriyawongkul's (article)[https://www.facebook.com/notes/art-suriyawongkul/%E0%B9%81%E0%B8%9B%E0%B8%A5%E0%B8%87%E0%B8%A3%E0%B9%88%E0%B8%B2%E0%B8%87%E0%B8%A3%E0%B8%B1%E0%B8%90%E0%B8%98%E0%B8%A3%E0%B8%A3%E0%B8%A1%E0%B8%99%E0%B8%B9%E0%B8%8D-29-%E0%B8%A1%E0%B8%84-2559-%E0%B8%89%E0%B8%9A%E0%B8%B1%E0%B8%9A%E0%B8%A1%E0%B8%B5%E0%B8%8A%E0%B8%B1%E0%B8%A2-%E0%B9%80%E0%B8%9B%E0%B9%87%E0%B8%99-plain-text/10154493302702646] in order to prepare Thai constitution code in machine readable format.

## Prerequisites
* ruby with gem and bundler
* wget
* bash
* OpenJDK (JRE only)


## Install
* Download Apache PDFBox
```
./download_pdfbox.sh
```
* Install gems
```
bundle install --path=vendor
```
## Usage example
```
# download PDF
wget http://www.ratchakitcha.soc.go.th/DATA/PDF/2561/E/063/24.PDF 

# Convert PDF to HTML
./pdf-to-html.sh 24.PDF

# Extract text from HTML
bundle exec ruby extract_text.rb < 24.html
```
## Note
This script is not supposed to cover every case. So please add issues and/or submit pull requests.
