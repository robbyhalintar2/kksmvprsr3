#!/bin/bash

TOKEN="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"
today=`date -d "0 days" +"%Y-%m-%d"`
git clone https://github.com/robbyhalintar2/scvps.git /root/scvps/ &> /dev/null
clear

echo -e ""
read -p "Input IP Address : " ip
CLIENT_EXISTS=$(grep -w $ip /root/scvps/izinIP | wc -l)

if [[ ${CLIENT_EXISTS} == '1' ]]; then
    echo "IP Already Exist !"
    rm -rf /root/scvps
    exit 0
fi

echo -e ""
read -p "Input username : " name
echo -e ""

clear
echo -e "Pilih waktu expired:"
echo -e "1. 30 days"
echo -e "2. 60 days"
echo -e "3. 90 days"
echo -e "4. Lifetime"

read -p "Masukkan nomor pilihan: " exp_option

case $exp_option in
    1)
        exp="30"
        ;;
    2)
        exp="60"
        ;;
    3)
        exp="90"
        ;;
    4)
        exp="360"
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

exp2=`date -d "${exp} days" +"%Y-%m-%d"`
echo "### ${name} ${exp2} ${ip}" >> /root/scvps/izinIP

cd /root/kksmvprsr3
git config --global user.email "robbyhalintar2@gmail.com" &> /dev/null
git config --global user.name "TEMPEST" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m register &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/robbyhalintar2/kksmvprsr3
git push -f https://${TOKEN}@github.com/robbyhalintar2/kksmvprsr3.git &> /dev/null
rm -rf /root/scvps
clear
