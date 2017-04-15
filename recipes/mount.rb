#
# Cookbook Name:: cifs
# Recipe:: mount
#
# Copyright 2013, Olivier Brisse
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default_options = [
  node['cifs']['default_mount_options'],
  "credentials=#{node['cifs']['credential_file']}"
].join(',')

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
