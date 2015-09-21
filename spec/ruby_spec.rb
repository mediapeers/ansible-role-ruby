require 'spec_helper'

describe "Ruby installation" do
  ruby_version = ANSIBLE_VARS.fetch('ruby_version_string', 'FAIL').split('-').last
  if ANSIBLE_VARS.fetch('ruby_version_string', 'FAIL').include?('-')
    ruby_edition = ANSIBLE_VARS.fetch('ruby_version_string', 'FAIL').split('-').first
  else
    ruby_edition = 'ruby'
  end

  describe package('build-essential') do
    it { should be_installed }
  end

  describe file('/opt/rubies') do
    it { should be_directory }
  end

  describe file("/opt/rubies/#{ruby_edition}-#{ruby_version}") do
    it { should be_directory }
  end

  describe command('ruby -v') do
    its(:stdout) { should match /#{ruby_edition} #{ruby_version}/ }
  end

  # disable/change if you overwrite the default version
  describe command('gem -v') do
    its(:stdout) { should match /2.4/ }
  end

  describe file('/usr/local/bin/ruby') do
    it { should be_symlink }
  end

  describe file('/usr/local/bin/gem') do
    it { should be_symlink }
  end

  describe file('/usr/local/bin/rake') do
    it { should be_symlink }
  end

  describe file('/usr/local/bin/irb') do
    it { should be_symlink }
  end

  describe file('/usr/local/bin/bundle') do
    it { should be_symlink }
  end

  # Should cleanup after itself
  describe file("/usr/local/src/#{ruby_edition}-#{ruby_version}") do
    it { should_not exist }
  end

  describe file("/usr/local/src/#{ruby_edition}-#{ruby_version}.tar.bz2") do
    it { should_not exist }
  end
end
