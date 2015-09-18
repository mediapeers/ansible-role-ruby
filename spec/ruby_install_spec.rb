require 'spec_helper'

describe "Ruby install setup" do
  describe command('ruby-install --version') do
    its(:stdout) { should match /ruby-install: 0.5/ }
  end
end
