require 'spec_helper'

describe "Ruby install setup" do
  describe package('make') do
    it { should be_installed }
  end


  describe command('ruby-install --version') do
    its(:stdout) { should match /ruby-install: 0.5/ }
  end
end
