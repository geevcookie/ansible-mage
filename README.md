Ansible Mage
============

A set of Ansible tools to ease the pain of installing Magento on a new server.

## What It Does

The default.yml playbook will install PHP, MySQL, Nginx, and Magento. Once it
completes successfully you will be able to access the Magento installation via
the IP address of the server.

## Ansible Variables

The Ansible playbook and roles require a few variables.

### Required Variables

The following variables are required and I recommend specifying them via
the -e option when running the playbook.

```
mage_repo_user: '',
mage_repo_pass: ''
```

The above details will then be used when doing a new metapackage installation.

For more information on how to retrieve these keys please see:
[http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html](http://devdocs.magento.com/guides/v2.0/install-gde/prereq/connect-auth.html)

### Magento Variables

```
mage_admin_uri: admin
mage_key: 1234567890qwerty
mage_db_host: localhost
mage_db_name: magento
mage_db_user: magento
mage_db_pass: m@g3nt0
mage_language: en_GB
mage_currency: ZAR
mage_timezone: Africa/Johannesburg
mage_rewrites: 1
mage_secure: 0
mage_url: http://192.168.2.2
mage_secure_url: https://192.168.2.2
mage_admin_user: admin
mage_admin_pass: m@g3nt0
mage_admin_email: admin@newmagento.com
mage_admin_first_name: magento
mage_admin_last_name: user
```

## Installation

* Clone this repo
* Create an inventory file in the same directory (e.g. *hosts.ini*)
* Run the following command:

```
ansible-playbook -i <inventory file> normal.yml -e "mage_repo_user=<public key> mage_repo_pass=<private key>"
```

Once the command completes successfully Magento will be available via the 
IP address of the server.

## Testing

A handy Vagrant file is included so that the Ansible playbook can be tested
easily.

### Requirements

* Vagrant
* ServerSpec

A *Gemfile* is included to make installing ServerSpec easier. Simply run
`bundle install` in the root directory.

### Running The Tests

Edit *Vagrantfile* and add your public and private key in the following lines:

```
mage_repo_user: '',
mage_repo_pass: ''
```

Run `vagrant up`. This will bring up the Vagrant VM and run the Ansible
playbook to provision it.

Once the VM is up you can run the following command to run the ServerSpec
tests: `rake spec`