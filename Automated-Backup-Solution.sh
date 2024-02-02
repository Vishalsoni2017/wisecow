#/bin/bash
echo "Caution : must enable ssh without password to remote server"
echo " "
echo "Enter Source Directory needs to backup"
read source_dir

echo "Enter remove server info with target location"
read remote_server

LOG_FILE="/home/backup/backup_log.txt"


backup_fucntion(){
    echo "function"
    echo "Backup stating at - $(date)" >> "$LOG_FILE"
    scp -r $source_dir $remote_server

    if [ $? -eq 0 ];
    then
        echo "Backup successfully completed!" >> "$LOG_FILE"
    else 
        echo "Backup failed!!" >> "$LOG_FILE"
    fi
}

main(){
   
    if [ ! -d "$source_dir" ];
    then
        echo "Error : Source directory not present!"
        exit 1
    fi

    echo "Backup script start at - $(date)" >> "$LOG_FILE"

    backup_fucntion

    echo "Backup report avaliable in : " "$LOG_FILE"
}


main
