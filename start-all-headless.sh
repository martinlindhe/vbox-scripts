#!/bin/bash
#
# starts all vm:s in headless mode

VBoxManage startvm "Debian 5 (Lenny) server 64bit" --type headless
VBoxManage startvm "Debian 6 (Squeeze) server 64bit" --type headless
VBoxManage startvm "Debian 7 (Wheezy) server 64bit" --type headless
VBoxManage startvm "Debian Unstable (sid) server 64bit" --type headless
