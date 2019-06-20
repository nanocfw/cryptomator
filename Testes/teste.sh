#!/bin/bash
runs=10
iso=/media/ramdisk/centos.iso
pasta=/media/ramdisk/centos/
fileout="teste.txt"

run_copy()
{
	echo "$1 > $2" >> $4
	for i in $(seq 1 $runs)
	do
		echo "started run no: $i"
		sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
		wait
		rsync -vhh $3 --progress $1 $2 >> $4
		wait
		rm -r $2
		wait
	done
	echo "----------------------------------------------------------" >> $4
}

#file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_hd_sgx.txt"
#echo $file_out

sudo hdparm -W 0 /dev/sda
sudo hdparm -A 0 /dev/sda
sudo hdparm -W 0 /dev/sdc
sudo hdparm -A 0 /dev/sdc

sudo umount /media/ramdisk 
sudo mkdir /media/ramdisk
sudo chmod 777 /media/ramdisk/
sudo mount -t ramfs -o size=10G ramd /media/ramdisk
mount | tail -n 1

#rsync -qr /home/pc/Downloads/centos.iso $iso
#rsync -qr /home/pc/Downloads/centos/ $pasta

#read -n1 -r -p "monte o sistema sgx no hd e pressione uma tecla..." key
#file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_hd_sgx.txt"
#run_copy $iso /media/pc/hdsgx/centos.iso -a $file_out
#file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_hd_sgx.txt"
#run_copy $pasta /media/pc/hdsgx/centos/ -r $file_out

#read -n1 -r -p "monte o sistema sgx no ssd e pressione uma tecla..." key
#file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_ssd_sgx.txt"
#run_copy $iso /media/pc/ssdsgx/centos.iso -a $file_out
#file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_ssd_sgx.txt"
#run_copy $pasta /media/pc/ssdsgx/centos/ -r $file_out

#read -n1 -r -p "monte o sistema sgx no m2 e pressione uma tecla..." key
#file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_m2_sgx.txt"
#run_copy $iso /media/pc/m2sgx/centos.iso -a $file_out
#file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_m2_sgx.txt"
#run_copy $pasta /media/pc/m2sgx/centos/ -r $file_out

#rm $iso
#rm -r $pasta

#read -n1 -r -p "monte o sistema sgx no hd e pressione uma tecla..." key
#rsync -qr /home/pc/Downloads/centos.iso /media/pc/hdsgx/centos.iso

#file_out="/home/pc/Documentos/execucao_pentium_copia_iso_hd_ram_sgx.txt"
#run_copy /media/pc/hdsgx/centos.iso $iso -a $file_out
#rm /media/pc/hdsgx/centos.iso
#rsync -qr /home/pc/Downloads/centos/ /media/pc/hdsgx/centos/
#file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_hd_ram_sgx.txt"
#run_copy /media/pc/hdsgx/centos/ $pasta -r $file_out
#rm -r /media/pc/hdsgx/centos/

read -n1 -r -p "monte o sistema sgx no ssd e pressione uma tecla..." key
rsync -qr /home/pc/Downloads/centos.iso /media/pc/ssdsgx/centos.iso

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ssd_ram_sgx.txt"
run_copy /media/pc/ssdsgx/centos.iso $iso -a $file_out
rm /media/pc/ssdsgx/centos.iso
rsync -qr /home/pc/Downloads/centos/ /media/pc/ssdsgx/centos/
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ssd_ram_sgx.txt"
run_copy /media/pc/ssdsgx/centos/ $pasta -r $file_out
rm -r /media/pc/ssdsgx/centos/

read -n1 -r -p "monte o sistema sgx no m2 e pressione uma tecla..." key
rsync -qr /home/pc/Downloads/centos.iso /media/pc/m2sgx/centos.iso

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_m2_ram_sgx.txt"
run_copy /media/pc/m2sgx/centos.iso $iso -a $file_out
rm /media/pc/m2sgx/centos.iso
rsync -qr /home/pc/Downloads/centos/ /media/pc/m2sgx/centos/
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_m2_ram_sgx.txt"
run_copy /media/pc/m2sgx/centos/ $pasta -r $file_out
rm -r /media/pc/m2sgx/centos/
exit
################################################################################### testar amanhã
read -n1 -r -p "monte o sistema cryptomator e pressione uma tecla..." key

#rsync -qr /home/pc/Downloads/centos.iso $iso
#rsync -qr /home/pc/Downloads/centos/ $pasta

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_hd_cryptomator.txt"
run_copy $iso /media/pc/hdcryptomator/centos.iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_ssd_cryptomator.txt"
run_copy $iso /media/pc/ssdcryptomator/centos.iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_m2_cryptomator.txt"
run_copy $iso /media/pc/m2cryptomator/centos.iso -a $file_out

file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_hd_cryptomator.txt"
run_copy $pasta /media/pc/hdcryptomator/centos/ -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_ssd_cryptomator.txt"
run_copy $pasta /media/pc/ssdcryptomator/centos/ -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_m2_cryptomator.txt"
run_copy $pasta /media/pc/m2cryptomator/centos/ -r $file_out

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_hd_sem_criptografia.txt"
run_copy $iso /media/pc/hd/centos.iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_ssd_sem_criptografia.txt"
run_copy $iso /media/pc/ssd/centos.iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_m2_sem_criptografia.txt"
run_copy $iso /media/pc/m2/centos.iso -a $file_out

file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_hd_sem_criptografia.txt"
run_copy $pasta /media/pc/hd/centos/ -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_ssd_sem_criptografia.txt"
run_copy $pasta /media/pc/ssd/centos/ -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_m2_sem_criptografia.txt"
run_copy $pasta /media/pc/m2/centos/ -r $file_out

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_hd_vera.txt"
run_copy $iso /media/pc/hdvera/centos.iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_ssd_vera.txt"
run_copy $iso /media/pc/ssdvera/centos.iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_m2_vera.txt"
run_copy $iso /media/pc/m2vera/centos.iso -a $file_out

file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_hd_vera.txt"
run_copy $pasta /media/pc/hdvera/centos/ -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_ssd_vera.txt"
run_copy $pasta /media/pc/ssdvera/centos/ -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_m2_vera.txt"
run_copy $pasta /media/pc/m2vera/centos/ -r $file_out

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_hd_luks.txt"
run_copy $iso /media/pc/hdluks/centos.iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_ssd_luks.txt"
run_copy $iso /media/pc/ssdluks/centos.iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ram_m2_luks.txt"
run_copy $iso /media/pc/m2luks/centos.iso -a $file_out

file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_hd_luks.txt"
run_copy $pasta /media/pc/hdluks/centos/ -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_ssd_luks.txt"
run_copy $pasta /media/pc/ssdluks/centos/ -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ram_m2_luks.txt"
run_copy $pasta /media/pc/m2luks/centos/ -r $file_out

rm $iso
rm -r $pasta

rsync -qr /home/pc/Downloads/centos.iso /media/pc/hdcryptomator/centos.iso
rsync -qr /home/pc/Downloads/centos.iso /media/pc/ssdcryptomator/centos.iso
rsync -qr /home/pc/Downloads/centos.iso /media/pc/m2cryptomator/centos.iso

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_hd_ram_cryptomator.txt"
run_copy /media/pc/hdcryptomator/centos.iso $iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ssd_ram_cryptomator.txt"
run_copy /media/pc/ssdcryptomator/centos.iso $iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_m2_ram_cryptomator.txt"
run_copy /media/pc/m2cryptomator/centos.iso $iso -a $file_out

rm /media/pc/hdcryptomator/centos.iso
rm /media/pc/ssdcryptomator/centos.iso
rm /media/pc/m2cryptomator/centos.iso

rsync -qr /home/pc/Downloads/centos/ /media/pc/hdcryptomator/centos/
rsync -qr /home/pc/Downloads/centos/ /media/pc/ssdcryptomator/centos/
rsync -qr /home/pc/Downloads/centos/ /media/pc/m2cryptomator/centos/

file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_hd_ram_cryptomator.txt"
run_copy /media/pc/hdcryptomator/centos/ $pasta -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ssd_ram_cryptomator.txt"
run_copy /media/pc/ssdcryptomator/centos/ $pasta -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_m2_ram_cryptomator.txt"
run_copy /media/pc/m2cryptomator/centos/ $pasta -r $file_out

rm -r /media/pc/hdcryptomator/centos/
rm -r /media/pc/ssdcryptomator/centos/
rm -r /media/pc/m2cryptomator/centos/

rsync -qr /home/pc/Downloads/centos.iso /media/pc/hd/centos.iso
rsync -qr /home/pc/Downloads/centos.iso /media/pc/ssd/centos.iso
rsync -qr /home/pc/Downloads/centos.iso /media/pc/m2/centos.iso

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_hd_ram_sem_criptografia.txt"
run_copy /media/pc/hd/centos.iso $iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ssd_ram_sem_criptografia.txt"
run_copy /media/pc/ssd/centos.iso $iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_m2_ram_sem_criptografia.txt"
run_copy /media/pc/m2/centos.iso $iso -a $file_out

rm /media/pc/hd/centos.iso
rm /media/pc/ssd/centos.iso
rm /media/pc/m2/centos.iso

rsync -qr /home/pc/Downloads/centos/ /media/pc/hd/centos/
rsync -qr /home/pc/Downloads/centos/ /media/pc/ssd/centos/
rsync -qr /home/pc/Downloads/centos/ /media/pc/m2/centos/

file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_hd_ram_sem_criptografia.txt"
run_copy /media/pc/hd/centos/ $pasta -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ssd_ram_sem_criptografia.txt"
run_copy /media/pc/ssd/centos/ $pasta -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_m2_ram_sem_criptografia.txt"
run_copy /media/pc/m2/centos/ $pasta -r $file_out

rm -r /media/pc/hd/centos/
rm -r /media/pc/ssd/centos/
rm -r /media/pc/m2/centos/

rsync -qr /home/pc/Downloads/centos.iso /media/pc/hdluks/centos.iso
rsync -qr /home/pc/Downloads/centos.iso /media/pc/ssdluks/centos.iso
rsync -qr /home/pc/Downloads/centos.iso /media/pc/m2luks/centos.iso

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_hd_ram_luks.txt"
run_copy /media/pc/hdluks/centos.iso $iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ssd_ram_luks.txt"
run_copy /media/pc/ssdluks/centos.iso $iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_m2_ram_luks.txt"
run_copy /media/pc/m2luks/centos.iso $iso -a $file_out

rm /media/pc/hdluks/centos.iso
rm /media/pc/ssdluks/centos.iso
rm /media/pc/m2luks/centos.iso

rsync -qr /home/pc/Downloads/centos/ /media/pc/hdluks/centos/
rsync -qr /home/pc/Downloads/centos/ /media/pc/ssdluks/centos/
rsync -qr /home/pc/Downloads/centos/ /media/pc/m2luks/centos/

file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_hd_ram_luks.txt"
run_copy /media/pc/hdluks/centos/ $pasta -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ssd_ram_luks.txt"
run_copy /media/pc/ssdluks/centos/ $pasta -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_m2_ram_luks.txt"
run_copy /media/pc/m2luks/centos/ $pasta -r $file_out

rm -r /media/pc/hdluks/centos/
rm -r /media/pc/ssdluks/centos/
rm -r /media/pc/m2luks/centos/

rsync -qr /home/pc/Downloads/centos.iso /media/pc/hdvera/centos.iso
rsync -qr /home/pc/Downloads/centos.iso /media/pc/ssdvera/centos.iso
rsync -qr /home/pc/Downloads/centos.iso /media/pc/m2vera/centos.iso

file_out="/home/pc/Documentos/execucao_pentium_copia_iso_hd_ram_vera.txt"
run_copy /media/pc/hdvera/centos.iso $iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_ssd_ram_vera.txt"
run_copy /media/pc/ssdvera/centos.iso $iso -a $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_iso_m2_ram_vera.txt"
run_copy /media/pc/m2vera/centos.iso $iso -a $file_out

rm /media/pc/hdvera/centos.iso
rm /media/pc/ssdvera/centos.iso
rm /media/pc/m2vera/centos.iso

rsync -qr /home/pc/Downloads/centos/ /media/pc/hdvera/centos/
rsync -qr /home/pc/Downloads/centos/ /media/pc/ssdvera/centos/
rsync -qr /home/pc/Downloads/centos/ /media/pc/m2vera/centos/

file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_hd_ram_vera.txt"
run_copy /media/pc/hdvera/centos/ $pasta -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_ssd_ram_vera.txt"
run_copy /media/pc/ssdvera/centos/ $pasta -r $file_out
file_out="/home/pc/Documentos/execucao_pentium_copia_pasta_m2_ram_vera.txt"
run_copy /media/pc/m2vera/centos/ $pasta -r $file_out

rm -r /media/pc/hdvera/centos/
rm -r /media/pc/ssdvera/centos/
rm -r /media/pc/m2vera/centos/

