name             'cifs'
maintainer       'Olivier Brisse'
maintainer_email 'obrisse@aioinissaydowa.com.au'
license          'Apache 2.0'
description      'Installs/Configures cifs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

supports 'ubuntu'
depends 'apt'

attribute 'password_data_bag',
  :display_name => 'Password Data Bag',
  :description => 'The data bag name containing the credentials',
  :default => 'passwords'

attribute 'credential_file',
  :display_name => 'Credential File',
  :description => 'File path for the CIFS credential file',
  :default => '/etc/samba/credentials'

attribute 'default_mount_options',
  :display_name => 'Default Mount Options',
  :description => 'Default options for cifs mounts',
  :default => 'noperm,rw,uid=root,file_mode=0660,dir_mode=0770'
