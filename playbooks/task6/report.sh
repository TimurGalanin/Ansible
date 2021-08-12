!/bin/bash
for ((;;))
do
echo "Введите комманду. Бесконечный цикл, нажмите CTRL+C для выхода"
read cmd1
ssh root@64.227.69.97 -t "echo '`$cmd1`$cmd1'  >> report.txt"

done
scp root@64.227.69.97:/root/report.txt /ansible/linux_severs/report.txt
