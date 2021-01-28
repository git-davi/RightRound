# RighRound : Dockerized VPN IP Rotator

*"You spin my IP right round, right round"*  
  
If you are here probably you are running a project about scraping and you have a low budget (:cry:), this is a small tool to avoid using the such expensive `rotating ip services` that you will find online.  
*First of all I want to point out that some VPN providers offer already vpn rotating functionality.*  
Btw this tool is completely agnostic to the service so it can work with every VPN, even the one made by you.  

## Setup and run
Put in `vpn_config/conn` your config `.ovpn` files.  
If you use NordVPN you can run just the script `nordvpn_downloader.sh` in the current dir or you can find them [here](https://nordvpn.com/ovpn/).  
```
$ ./nordvpn_downloader.sh
```
If you use HideMyAss check [here](https://vpn.hidemyass.com/vpn-config/OpenVPN-2.4/).  
Otherwise you have to gather it on your own...  
Place your credentials separated by a new line in `vpn_config/creds.txt` (if `auth-user-pass` is enabled).  
Finally just run :
```
$ sudo docker-compose up -d
```
The script will rotate **randomly** between supplied nodes every 30 minutes.  
You can modify the rotating delay time by changing the values in `ip_rotator/scripts/rotate.cron`.  
After you have to rebuild your docker image:
```
$ sudo docker-compose stop && sudo docker-compose rm 
$ sudo docker-compose build --no-cache
```
Easy as pie.  
To restart remove the container :
```
$ sudo docker-compose stop && sudo docker-compose rm
```

### About Contributing
If you would like to improve this project you are welcome.

## Troubleshooting
After stop the channel doesn't go encrypted. You will have to remove the container and start a new one. Or wait till cronjob starts again.  
```
$ sudo docker-compose rm && sudo docker-compose up -d
```
This will issue a reboot and make the cronjob start.