# Nginx + PHP-FPM provisioned by chef-solo on Vagrant

* Vagrant: [http://vagrantup.com](http://vagrantup.com)
* Nginx: 
* PHP-FPM

Vagrant is a tool for building and distributing virtualized development environments.

By providing automated creation and provisioning of virtual machines using [Oracle’s VirtualBox](http://www.virtualbox.org),
Vagrant provides the tools to create and configure lightweight, reproducible, and portable
virtual environments. For more information, see the part of the getting started guide
on “[Why Vagrant?](http://vagrantup.com/docs/getting-started/index.html)”

## Quick Start

First, make sure your development machine has [VirtualBox](http://www.virtualbox.org)
installed. The setup from that point forward is very easy, since Vagrant is simply
a rubygem.

    gem install vagrant

To build your this Nginx + PHP-FPM virtual environment:

    <clone this git repo>
    <cd into the Git repo>
    vagrant box add ubuntu_11.04_server_amd64 http://dl.dropbox.com/u/7490647/talifun-ubuntu-11.04-server-i386.box
    vagrant up
