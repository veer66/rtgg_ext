#!/bin/sh
set -x
java -jar pdfbox-app-2.0.13.jar ExtractText -html $1
