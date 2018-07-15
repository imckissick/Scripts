@Echo Off
net stop "w32time"
w32tm /config /syncfromflags:DOMHIER
net start "w32time"
w32tm /resync
@Echo on
exit