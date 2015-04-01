cifs Cookbook
=============
[![Build Status](https://travis-ci.org/aioi/chef-cifs.png?branch=master)](https://travis-ci.org/aioi/chef-cifs)

This cookbook install and configure CIFS.

Requirements
------------
Should work on Ubuntu or Debian systems.

Attributes
----------
* `node['cifs']['password_data_bag']` - The data bag name containing the credentials, default "passwords".
* `node['cifs']['credential_file']` - File path for the CIFS credential file, default "/etc/samba/credentials".
* `node['cifs']['default_mount_options']` - Default options applied to mounts (credential path is appended in the recipe)


Usage
-----
Just include `cifs` in your node's `run_list` to install the cifs client.

If you want to mount share you can use the `cifs::mount` recipe:

    node['cifs']['mounts']['/mnt/share'] =
      {
        'cifs_path' => '//server.example.org/share',
      }

    include_recipe 'cifs::mount'

Todo
----
* This cookbook assume that the credentials for all mounts within the same node are the same
* Better mount options management
* Extract the mount logic to a provider/resource ?

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: [Olivier Brisse](https://github.com/ouranos)
