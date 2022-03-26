#!/bin/bash

echo "Passed overworld file: $1 with directory name: $4"
echo "Passed nether file: $2 with directory name: $5"
echo "Passed the_end file: $3 with directory name: $6"
# systemctl stop minecraft@getoffmylawn_v
echo "Starting copy to gdrive..."
# tar cvf $4.tar $1 $2 $3
/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$1" "gdrive:getoffmylawn_backups/$4"
/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$2" "gdrive:getoffmylawn_backups/$5"
/usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$3" "gdrive:getoffmylawn_backups/$6"
# /usr/bin/rclone copy --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "$4.tar" "gdrive:getoffmylawn_backups/$4"


echo "Copy jobs are complete, restarting minecraft@getoffmylawn service..."
systemctl start minecraft@getoffmylawn_v
echo "Backup complete, issuing server reboot."
reboot now
