#IP ADDRESS THAT ARE UP
nmap -sP 192.168.7.1/24 | awk '/is up/ {print up}; {gsub (/\(|\)/,""); up = $NF}'
