#!/bin/bash

last_vaxt=$1  # $last_vaxt duzgun qebul elemek
boundary="ZZ_/afg6432dfgkl.94531q"
subject="Necefov Nicat - Backup file"
from="kamfariz0203@gmail.com"
to="nijatnajafov01@gmail.com"
file="/backup/$last_vaxt"
filename=$(basename "$file")
mimetype=$(file --mime-type -b "$file")

# file base64 ile kodirovka eleyiriy
encoded_file=$(base64 "$file")

#Duzgun MIME message yaradirig
{
  echo "From: $from"
  echo "To: $to"
  echo "Subject: $subject"
  echo "MIME-Version: 1.0"
  echo "Content-Type: multipart/mixed; boundary=\"$boundary\""
  echo ""
  echo "--$boundary"
  echo "Content-Type: text/plain; charset=\"UTF-8\""
  echo "Content-Transfer-Encoding: 7bit"
  echo ""
  echo "Backup ugurla basha chatdi"
  echo ""
  echo "--$boundary"
  echo "Content-Type: $mimetype; name=\"$filename\""
  echo "Content-Transfer-Encoding: base64"
  echo "Content-Disposition: attachment; filename=\"$filename\""
  echo ""
  echo "$encoded_file"
  echo ""
  echo "--$boundary--"
} > email_with_attachment.txt

