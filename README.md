# System Administrator 

<p align="center">
  <img align="center" width="50%" height="50%" src="https://media4.giphy.com/media/aariWjKu5N73y/giphy.gif">
</p>

### Goal

Create a VM Ubuntu Server 20.04 LTS (Focal Fissa) in a local environment with Vagrant. This VM have to run a web application available in [this repository]().

You have to sent your work in *Github* with this folowing files:
* :card_index_dividers: `Vagrantfile`
* :card_index_dividers: `install.sh`
* :card_index_dividers: `readme.md`

**Prerequisite**
>>>
* [Vagrant](https://www.vagrantup.com/downloads)
* [Virtual Box](https://www.virtualbox.org/)


## Setting up Ubuntu VM

### Vagrantfile
First, create a **Vagrantfile** (sample is provided), you should change the folowing configuration: 
* `config.vm.box`: Set the required Box (available [here](https://app.vagrantup.com/boxes/search))
* `vb.customize` : Following the configuration of your computer, you can increase or decrease values if needed (Ram, Core..)

### install.sh
Then, create "install.sh" bash script who contain all the command needed for install VM who running an web app.
*Sample is also provide with this test* : This sample contain only the basic command for configure linux. Feel free to improve this file. 

### Readme.md

Write a beautiful `readme.md` who contain all informations about versions you choose (Php, Apache...) and all significant informations needed for installation.
Doing it like a tutorial for begineer :shipit:

## Launch and test
Once the process is over, you should be able to connect in your VM by SSH in your terminal after build and run.

Usefull command
```bash
vagrant up # Start and build VM
vagrant destroy # Delete VM
vagrant ssh # Connect to SSH
vagrant halt # Stop the VM
```

### Configure your Windows Host

In your Windows environment, add new hostname
`C:\Windows\System32\drivers\etc\hosts` (In Administrator mode)

```
127.0.0.1    test.local
```

The Website will be available locally with this Url: http://test.local:4567/

## Pro tips
It's recommanded to create at begining an empty Ubuntu VM, try and launch command, and then add command line in `install.sh`
You can install in silent mode with `-y` command : `apt-get -y upgrade`

Good Luck ! :airplane:
