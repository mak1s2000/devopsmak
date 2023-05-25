for i in {1..50}; do curl -v -X GET https://USXXXXX.storage.XXXX.com/v1/Storage-USXXXX/javabackup -o /tmp/testing -w "%{time_total}, %{speed_upload}\n";done

