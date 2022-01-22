# System Administrator 

<p align="center">
  <img align="center" width="50%" height="50%" src="https://media4.giphy.com/media/aariWjKu5N73y/giphy.gif">
</p>

## Goal

With Vagrant, create an Ubuntu Server 20.04 LTS (Focal Fissa) in a local virtual machine. 

This VM have to run a Web environment for a PHP Symfony application available in [this repository](https://github.com/samir755/demo).

Your mission is to sent your Vagrant config in *Github* with this folowing files:
* :card_index_dividers: `Vagrantfile`
* :card_index_dividers: `install.sh`
* :card_index_dividers: `readme.md`

*This Web App will be available at http://localhost:4567/index.php with the command `vagrant up`.*

## Prerequisite
>>>
* [Install Vagrant](https://www.vagrantup.com/downloads)
* [Install Virtual Box](https://www.virtualbox.org/)
>>>

## Setting up Ubuntu VM

### Vagrantfile
First, create a **Vagrantfile** (sample provided), you should change the folowing configuration: 
* `config.vm.box`: Set the required Box (available [here](https://app.vagrantup.com/boxes/search)).
* `vb.customize` : Following the configuration of your computer, you can increase or decrease values if needed (Ram, Core..).

### install.sh
Then, create `install.sh` bash script who contain all the command line needed for install Web Server environment with the Symfony App.

`helpme.sh` file contain the basic command line for configure a linux Web Server. Feel free to use it. 

### Readme.md

Write a beautiful `readme.md` who contain all informations about versions you choose (Php, Apache...) and all significant informations needed for installation.

Doing it like a tutorial for begineer :shipit:

## Launch and test
Once the process is over, you should be able to connect in your VM by SSH in your terminal.

Usefull command
```bash
vagrant up # Start and build VM
vagrant destroy # Delete VM
vagrant ssh # Connect to SSH
vagrant halt # Stop the VM
```

The Website will be available locally at http://localhost:4567/index.php and PhpMyAdmin here http://localhost:4567/phpmyadmin.

## Pro tips
First, create an empty Ubuntu VM, try and launch your command line, and then add it in your `install.sh`.

You can use the **silent mode** with `-y` for Linux command and `--no-interaction` for Composer.

Good Luck ! :airplane:
