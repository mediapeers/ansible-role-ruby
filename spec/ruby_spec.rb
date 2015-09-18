require 'spec_helper'

describe "Ruby installation" do
  ruby_version = ANSIBLE_VARS.fetch('ruby_version', 'FAIL').split('-').last
  if ANSIBLE_VARS.fetch('ruby_version', 'FAIL').include('-')
    ruby_edition = ANSIBLE_VARS.fetch('ruby_version', 'FAIL').split('-').first
  else
    ruby_edition = 'ruby'
  end

  describe package('build-essential') do
    it { should exist }
  end

  describe file('/opt/rubies') do
    it { should be_directory }
  end

  describe file("/opt/rubies/#{ruby_version}") do
    it { should be_directory }
  end

  describe command('ruby -v') do
    its(:stdout) { should match /#{ruby_edition} #{ruby_version}/ }
  end

  describe command('gem -v') do
    its(:stdout) { should match /2.4/ }
  end
end
