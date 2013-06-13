# run "python -m SimpleHTTPServer &" before running docker build

from    ubuntu:12.10
run     apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
run     bash -c "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/10gen.list"
run     apt-get update
run     bash -c "apt-get install openssh-server supervisor mongodb-10gen -y || true"
run     mkdir -p /data/db
run     mkdir -p /var/run/sshd
run     mkdir -p /var/log/supervisor
run     locale-gen en_US en_US.UTF-8
run     /bin/sh -c 'echo root:testpass | chpasswd'
add     supervisord.conf /etc/supervisor/conf.d/supervisord.conf
expose  27017 22
cmd     ["/usr/bin/supervisord", "-n"]
