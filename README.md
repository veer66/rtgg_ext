# rtgg_ext

rtgg_ext is a script for extracting plain text from PDF files Royal Thai Government Gazette.

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
