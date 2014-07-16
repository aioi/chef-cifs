#
# Cookbook Name:: cifs
# Attributes:: default
#
# Copyright (C) 2013 Olivier Brisse
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

default['cifs']['password_data_bag'] = 'passwords'
default['cifs']['credential_file'] = '/etc/samba/credentials'
default['cifs']['default_mount_options'] = 'noperm,rw,uid=root,file_mode=0660,dir_mode=0770'
