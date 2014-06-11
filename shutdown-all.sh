#!/bin/bash
#
# sends ACPI power off to all running vm:s



# 1. get list of running: VBoxManage list runningvms

# TODO some bash magic to extract uuid or full name from VBoxManage list runningvms

# all Debian vm:s
## vmList=`VBoxManage list runningvms | grep Debian`


VBoxManage controlvm "Debian 5 (Lenny) server 64bit" acpipowerbutton
VBoxManage controlvm "Debian 6 (Squeeze) server 64bit" acpipowerbutton
VBoxManage controlvm "Debian 7 (Wheezy) server 64bit" acpipowerbutton
VBoxManage controlvm "Debian Unstable (sid) server 64bit" acpipowerbutton
