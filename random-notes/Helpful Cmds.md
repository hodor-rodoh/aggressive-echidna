#### Git

`git branch` --> shows current branch

`git clone "URL"` --> clones a repo locally

`git pull` --> updates stuff (example you are on the master branch.
  Git will take the most current master and update your local repo)

`git checkout -b "name"` --> checks out and creates a branch

`git status` --> checks the status of stuff

`git add .` --> readies up your changes to be committed   

`git commit -m "comments"` --> commits your changes

`git push origin branch-name` --> pushes your branch back to
master/origin to make a PR

`git checkout origin/"branch name"` --> this lets you checkout a remote branch
that hasn't been merged yet

`git reset --hard HEAD` --> reset yo stuff

`git branch -d $BranchName` --> deletes branch

`git branch -m new-name` --> rename branch

#### Azure Shit
`az login` --> login to azure

`az account show` --> shows my current context

`az account set --subscription "Sub Name"` --> sets an azure account

export `ARM_ACCESS_KEY=pcRLP1NCWzWSy5XeoRFo3Dv30jMwdE+EGQVgB8eUyInyLGcHV72e7lmSfufgjffWLephkls0VRWJFn+xpsNqyA==`
#### Bashfuls

#!/usr/bin/env bash

#### GCloud

`gcloud container clusters get-credentials` --> lets you switch clusters

#### Docker

`usermod -aG docker <ssh_user>` --> adds docker permission for user

`docker stop $(docker ps -a -q)` --> stops all docker images

`docker rm $(docker ps -a -q)` --> removes all docker images

#### Kubernetes (KUBECTL)

`-o wide` --> shows more details

`-o yaml` --> poops out the yaml file for w/e you're looking at

`kubectl config get-context` --> lists all my stuff

`kubectl config current-context` --> shows current context

`kubectl config use-context CONTEXT_NAME` --> lets you change between contexts

`kubectl delete deployment "name"`

`kubectl get pods --context am360-kube0 -n takumi` --> can do anything if you set context + namespace

`export KUBECONFIG=~/.kube/azure` --> mounts my config file to switch between different providers [gke,azure,aws]

`unset KUBECONFIG` --> unsets my current config

`kubectl get pods -n namespace` --> lists all the pods in a specific namespace

`kubectl get services -n namespace` --> shows all the services

`kubectl get ingress -n namespace` --> shows all the ingress rules

`kubectl get daemonsets -n namespaces` --> shows all daemonsets

`kubectl logs --tail=-1,1,0 $pod_name -n namspace` --> helps you tail logs if something is crashing

`kubectl describe pods $pod_name -n namespace` --> shows you some junk and also events

`kubectl get serviceAccounts` --> list the service accounts

`kubectl delete serviceaccount/name-of-account` --> deletes service account. why is this in lowercase though?

`kubectl --kubeconfig kube_config_tc660-kube0.yaml get pods --all-namespaces`

#### Rinux stuff

`ssh-copy-id -i ~/.ssh/<key-name> <user@host`> --> copies ssh key to server

`/Users/sean.shen/.kube/config:/Users/sean.shen/.kube/nuc-config.yaml` -->
changes env variable

### Herpfur CMDS
`ls -al` --> list directories and other stuff

`udevadm info --query=all –-name=/dev/` --> queries stuff :fire:

`mknod /dev/sda b 8 2` --> make a block device

`mkfs -t ext4 /dev/sdf2` --> outputs a *superblock* keep that info

`mount -t type device mountpoint` --> `mount -t ext4 /dev/sdf2 /home/extra` (example)

`mount "UUID" mountpoint` :smirk:

`umount mountpoint` --> do the unmountful :disappointed:

`mount -t vfat /dev/hda1 /dos -o ro,conv=auto` --> read-only + convert some text

`mount -n -o remount /` --> remount :smirk: assumes current in /etc/fstab

you can also mount by UUID since device names can change but UUID is constant.

`-r` --> mounts in read onry mode

`-n` --> says no to update system runtime mount DB. good for when there is system prob
`-t` --> designate file type
`-o` --> long option :smirk: lets you be more flexible.
(`exec/noexec`) --> enables/disables execution of programs
(`suid/nosuid`) --> enable/disable setuid programs
(`ro`) --> read onry mountful
(`rw`) --> read write mountful
`df` --> overall resource usage/capacity
`du` --> views whats using resources, detailed
`fsck -p/-a` --> check filesystem if you were being naughty. unmount first before running
`free` --> shows available swap **good troubleshooting**
`proc/meminfo` --> how much real memory for cache and buffers
`dd if=/dev/zero of=swap_file bs=1024k count=num_mb` --> makes a swap file
`mkswap swap_file` --> initialize swap_file
`swapon swap_file` --> add it to the swap pool mr.miyagi style
`lsof` --> shows opened files it is p good
`strace` --> system call trace
`ltrace` --> library trace
`ps m -o pid,tid,command` --> view threads and their TID
`renice 20 pid` --> change nice make process run when nothing is running
not too important anymore but good to know SUGOI :fire:
`uptime` --> shows load average from 1min , 5min, 15min
`ps -o pid,min_flt,maj_flt` --> minor and major page faults
`vmstat` --> shows some Stuff
`iostat` + `-p ALL`--> shows some other stuff and partitions
`/etc/security/limit.conf` --> shows limits and you can edit :fire:
`route -n` --> route table huehue
`traceroute hostname` --> route that trace
`host name` --> translates name into IP
`route add -net 192.168.45.0/24 gw 10.23.2.44` --> override default gateway
`sysctl -w net.ipv4.ip_forward` --> enable ip forwarding (config is in /etc/sysctl.conf)
`iptables -A INPUT -p icmp -j ACCEPT` --> enable icmp (ping and etc)
`iptables -A INPUT -p tcp --destination-port 22 -j ACCEPT` --> enable SSH
`arp -n` --> A-ARP resolves ip into mac. does the caching :dollar:
`ssh-keygen -t rsa1 -N '' -f /etc/ssh/ssh_host_key` --> ssh rsa keygen
`tcpdump` --> :hankey: of stuff
`netcat` --> same thing but better for remote hosts :cat:
`nmap` --> scans for ports
`python -m SimpleHTTPServer` --> makes simpre server
`rsync` --> is pretty :fire: and frexibre

## Vault things

`vault login -method=github`
`vault list pg/kv/clusters/~`

## IP Address STUFF

```
vim /etc/network/interfaces

change inet auto to inet static
address 192.168.2.241 & 242
netmask 255.255.255.0
gateway 192.168.2.254
dns-nameservers 8.8.8.8 8.8.4.4

sudo /etc/init.d/networking restart
```

### JQ

kubectl get rs --context am560-kube0 -o json -n takumi | jq -r '.items[].metadata | { app: .labels.app }'
kubectl get rs --context am560-kube0 -o json -n takumi | jq -r '.items[].meta | select (.replicas | contains(0) | not)'
kubectl get rs --context am560-kube0 -o json --all-namespaces | jq -r '[.items[] |  { name: .metadata.name, namespace: .metadata.namespace, replicaCount: .status.replicas } | select(.replicaCount == 1)]'
