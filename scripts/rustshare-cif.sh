sudo mount -t cifs -o rw,vers=3.0,credentials=/root/.smbcredentials,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777 //10.0.0.108/rust /mnt/rustshare
