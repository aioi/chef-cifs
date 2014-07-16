require_relative '../../../kitchen/data/spec_helper'

describe 'cifs::default' do
  describe package('cifs-utils') do
    it { should be_installed }
  end

  # Databag, create the credentials file
  describe file('/etc/samba/credentials') do
    it { should be_file }
    it { should contain 'username=hsolo' }
    it { should contain 'password=foobar' }
  end
end
