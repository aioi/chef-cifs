#
# Cookbook Name:: cifs
# Recipe:: default
#
# Copyright 2013, Olivier Brisse
#
# All rights reserved - Do Not Redistribute
#


# Install required packages

case node['platform']
  when 'ubuntu'
    if node['platform_version'].to_f <= 10.04
      pkg = 'smbfs'
    else
      pkg = 'cifs-utils'
    end
  else
    Chef::Log.fatal("#{node['platform']} not supported")
end

package pkg

# Credentials files
bag = node['cifs']['password_data_bag']
credentials = Chef::EncryptedDataBagItem.load(bag, 'cifs')

if credentials
  template node['cifs']['credential_file'] do
    source 'credentials.erb'
    owner 'root'
    group 'root'
    mode '0600'

    variables(
      :username => credentials['username'],
      :password => credentials['password']
    )
  end
end