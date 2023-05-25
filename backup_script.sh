filename="`hostname -s`_ringmaster_backup_`date +%F`.tar.gz"

echo "file name $filename"

tar -cvzpf /u01/storaas/backups/$filename /u01/etc_swift /u01/oss/admin/log  --exclude=/etc/swift/ins/*.zip
etag=`md5sum /u01/storaas/backups/$filename | awk '{print $1}'`

#gpg --yes --batch --passphrase=[zF5JZx0t] -c /u01/storaas/backups/$filename
resp_code=`curl  -X PUT -H 'X-Delete-After:5184000' -u 'mak1s2000@hotmail.com:my_password' https://XXXXX/v1/Storage-cachesysem3/ringmaster_backups/$filename -T /u01/storaas/backups/$filename -H "Etag: ${etag}" -w "%{http_code}\n"`
ret_code=$?
#sleep 600
if [ $ret_code -ne 0 ]; then
    echo “ERROR: Object upload with curl failed, curl_exit_code $ret_code.”
elif [ $resp_code -gt 299 ]; then
    echo "ERROR: Object upload failed with response code $resp_code"
fi
rm -f /u01/storaas/backups/$filename.*
