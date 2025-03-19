# yum install stress -y
# stress -c <how many processes you want stress service to run> -t <for how many seconds>

sleep 60 && stress -c 4 -t 60 && sleep 60 && -c 4 -t 30 && sleep 30 && stress -c 4 -t 200 && sleep 30 && stress -c 4 -t 500