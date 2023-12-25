#! /bin/bash
set -x
OUTPUT=~/brscan/brscan_$(date +%Y-%m-%d-%H-%M-%S)

sleep 1 # original scripts do this

scanimage --format=tiff -x 210 -y 297 --resolution 300  --source "Automatic Document Feeder(left aligned)" --batch="${OUTPUT}_%02d.tif"

if [ ! -e "${OUTPUT}_01.tif" ];then
  sleep 1
  scanimage --format=tiff -x 210 -y 297 --resolution 300  --source "Automatic Document Feeder(left aligned)" --batch="${OUTPUT}_%02d.tif"
fi

if [ ! -e "${OUTPUT}_01.tif" ];then
  echo "Scan failed"
  exit 1
fi

tiffcp -c lzw ${OUTPUT}*.tif ${OUTPUT}-cp.tif

tiff2pdf -o "${OUTPUT}-tif.pdf" -z -p A4 "${OUTPUT}-cp.tif"

gs -sDEVICE=pdfwrite -dPDFSETTINGS=/printer -dNOPAUSE -dBATCH -dQUIET -sOutputFile="${OUTPUT}.pdf" "${OUTPUT}-tif.pdf"

cp "${OUTPUT}.pdf" ~/paperless-ngx/consume/

rm ${OUTPUT}*

