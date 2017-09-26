#!/bin/bash
cat /etc/hosts


cat > /home/vagrant/.ssh/config <<EOF
Host *
    StrictHostKeyChecking no
EOF

cat > /home/vagrant/.ssh/id_rsa.pub <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6eOZwz089mdDHN44EO9MmYZ+4yr0kwc5TdAnGjqsssjtLfyRI5oGNBCuc/k+I3gK1bXJ/kWvDmL+R/FB83chAARVaQr3f7OtEgx36pp6fkQ+9pmvzLqMnFJgVSolVwF5MQGwgIhGlYjF09N5OiVe+t3SwZw39U+taPMmNZ/7U3sgkziATny+M8J1knRS3YeBcrIJ6JK2ajIQrRA1k/T738Z6wbf5Md5T1QEIWDSpd0JltYK409WZv0YdCIG8oG9azkt8Wqhs738zj6zhB0BPUBip44CPGx2JJeuWyhXpJTHTo0a58S28GyAf5C3W55mqs1BU+26cBXyAF5fe3zuS/
EOF

cat > /home/vagrant/.ssh/id_rsa <<EOF
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAunjmcM9PPZnQxzeOBDvTJmGfuMq9JMHOU3QJxo6rLLI7S38k
SOaBjQQrnP5PiN4CtW1yf5Frw5i/kfxQfN3IQAEVWkK93+zrRIMd+qaen5EPvaZr
8y6jJxSYFUqJVcBeTEBsICIRpWIxdPTeTolXvrd0sGcN/VPrWjzJjWf+1N7IJM4g
E58vjPCdZJ0Ut2HgXKyCeiStmoyEK0QNZP0+9/GesG3+THeU9UBCFg0qXdCZbWCu
NPVmb9GHQiBvKBvWs5LfFqobO9/M4+s4QdAT1AYqeOAjxsdiSXrlsoV6SUx06NGu
fEtvBsgH+Qt1ueZqrNQVPtunAV8gBeX3t87kvwIDAQABAoIBAA4QdlkF2dUsl8me
0BBTrs5TSKe4auGt2HEE7IPUWObLHpvIICV7dUP8j4mMyNTq4ctrUNp8TmN3TuOk
4zE3zRW+vyyKoiWUif4l4Yn5LTedylEkjznNR7L346yfbZJRKwuXRFB8IVaW/GH0
4huMUljpH1z6uNxlivfIY+9Na7QEZGIdkBtH+AobAoXO2TfYIVBn2AA6fL/oJ4VL
fAQd6XoQFABPCrLHeDKzvlvlQ1kcXhIztBBE50tQeybt//I68NRV9yO0aTViQyj6
KqWxDol+zDbESwstNwBd7jb/s+jcG1PTaigVoPyyCLNck2A7MT51x20b2cRNZj/4
TAl9S5ECgYEA9sYsr1rbO3K1iRt7Z1GmX+YNcht9WeWL9rKW1jS3GfWN8ngsWUuF
kSzQn2Tj4gSuuXPf8uYXTFUYcUiYj2qNXed0FVF5WQemKo2GTviZl5OoNaQ5VQWo
4pFpZnw7bsw3CrR9J/BOZ978szwRwoejZfEJzc14ZQAFKT+EPvThs2kCgYEAwXGW
tUzh0eq8hdHWyXvUMpg5oyPYofEiw5Gw7aq102OSOp+TeRg+C1Xg8yQn0eJXAJ/4
CwPTMmH/jGXrk7NBj10XndE6p7KsRRoyYh7P0y3PB6c0hBmdlVZX5tksofZgPgfb
BrPGSCK3u9UYbN/9O3E19QzZI6Xux+/w6/5C2ecCgYBAJsKFD3yAltBkhTVuZYZ3
1alXKZhLn2XkSwb1Rpz27aPqDZ2R1RUy6VCOrz6iig8V/O6SCYiy+kgxYuruFYgM
ilfeFuER6PAkjcgFjZD4G5WV5ExXMvJ1e9HHp7IXmpUQfl0u3cS0Mf7FZW9Ef9hV
bvTagHi04O12jKGHcEegSQKBgGWNYSX6n45ZIfFKsOyDYmnROmjnt6GEetCamnya
ouu/mRPHlF79GA1RX0+linYH0c7VLB10O5p2kfa9xsd6Uo+VuoEyRw2kogWA9DRI
oqflo4sL/2jeHbk5Y9of5ut78Rh/fT9uf0h9WWF1RGZbzJA5Ja9ouFGbmdhCoYLy
r1u/AoGBALPZbtBS/WLgrwokr/gQpad1VSk4mr0BVqV895TD/OJMHvzirT79imAX
P/VRqJNLMs+NPjMgJz+BsProkZqe2oHdkOTFJuvhKZ69KWQSnfPnZJZeVk4qw7UF
NNarJCLARddpNhmTx8o9+rqSkYvDsm57XIi+4PnYc3KfwJmKC7xz
-----END RSA PRIVATE KEY-----
EOF

cat >>  /home/vagrant/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6eOZwz089mdDHN44EO9MmYZ+4yr0kwc5TdAnGjqsssjtLfyRI5oGNBCuc/k+I3gK1bXJ/kWvDmL+R/FB83chAARVaQr3f7OtEgx36pp6fkQ+9pmvzLqMnFJgVSolVwF5MQGwgIhGlYjF09N5OiVe+t3SwZw39U+taPMmNZ/7U3sgkziATny+M8J1knRS3YeBcrIJ6JK2ajIQrRA1k/T738Z6wbf5Md5T1QEIWDSpd0JltYK409WZv0YdCIG8oG9azkt8Wqhs738zj6zhB0BPUBip44CPGx2JJeuWyhXpJTHTo0a58S28GyAf5C3W55mqs1BU+26cBXyAF5fe3zuS/
EOF

# Ansible config tuning
ansible_home="\/vagrant\/"

## turn off fact gathering
sudo sed -i "s/^#gathering = implicit/gathering = explicit/g" /etc/ansible/ansible.cfg

## Set default hosts
sudo sed -i "s/^#inventory      = \/etc\/ansible\/hosts/inventory = ${ansible_home}\/hosts/g" /etc/ansible/ansible.cfg

## Set default roles
sudo sed -i "s/^#roles_path    = \/etc\/ansible\/roles/roles_path = ${ansible_home}\/playbooks\/roles:${ansible_home}\/playbooks\/roles\/commons:${ansible_home}\/playbooks\/roles\/apps/g" /etc/ansible/ansible.cfg

## Turn off ssh host key checking
sudo sed -i "s/^#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg

## Turn off host key recording
sudo sed -i "s/^#record_host_keys=False/record_host_keys=False/g" /etc/ansible/ansible.cfg

## Set callback white list
sudo sed -i "s/^#callback_whitelist = timer, mail/callback_whitelist=custom_slack/g" /etc/ansible/ansible.cfg

# ## Turn off SELunix
# sudo sed -i "s/^SELINUX=enforcing/SELINUX=permissive/g" /etc/sysconfig/selinux
