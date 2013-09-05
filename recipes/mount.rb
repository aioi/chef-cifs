#
# Cookbook Name:: cifs
# Recipe:: mount
#
# Copyright 2013, Olivier Brisse
#
# All rights reserved - Do Not Redistribute
#

default_options = node['cifs']['default_mount_options']
default_options << ",credentials=#{node['cifs']['credential_file']}"

node['cifs']['mounts'].each_pair do |path, config|
  directory path
  options = config['options'] || default_options

  mount path do
    device config['cifs_path']
    fstype 'cifs'
    options options
    action [:mount, :enable]
    not_if "grep #{path} /proc/mounts"
  end
end
