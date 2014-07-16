require_relative '../../../kitchen/data/spec_helper'

describe 'cifs::default' do
  describe package('cifs-utils') do
    it { should be_installed }
  end

  # No databag, skip file creation
  describe file('/etc/samba/credentials') do
    it { should_not be_file }
  end
end
