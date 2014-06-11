## About

collection of scripts to deal with virtualbox headless guests on OSX






## Setup

1: in virtualbox settings, create a "hosts only" network. 

	host ip: 10.99.99.1
	disable dns server
	setup dnsmasq on host to listen on interface "vboxnet0"


2. mac settings

to resolve *.vm domains, which we configured dnsmasq to handle:

	create file /etc/resolver/vm:
		nameserver 127.0.0.1

	bekräfta:

		scutil --dns


3. vm:s
	config network to "host only networking"




NOTES: http://passingcuriosity.com/2013/dnsmasq-dev-osx/

----



vboxmanage:

## list all vm:s

```
$ VBoxManage list vms
```



## list running vm:s:

  $ VBoxManage list runningvms



## see vm details:

  $ VBoxManage showvminfo "Debian 5 (Lenny) server 64bit"



## install vbox addons

NOTE: multiple versions of debian ship with their own "OSE edition" of the vbox guest drivers
first uninstall these

next, deps:

  sudo apt-get install dkms build-essential linux-headers-amd64

next attach vbox guest addition cd , and mount:

  sudo mount /dev/sr0 /media/cdrom     ## /dev/hdc on debian lenny
  cd /media/cdrom
  sudo ./VBoxLinuxAdditions.run


## HEADLESS

hold shift when clicking "start vm" in virtualbox gui

from cli:


  # Start VM in headless mode
  VBoxManage startvm MyVM --type headless

  # ACPI power off:
  VBoxManage controlvm MyVM acpipowerbutton

  # force Power off VM
  VBoxManage controlvm MyVM poweroff


