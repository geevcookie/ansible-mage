require 'spec_helper'

has_composerDir = file('/root/.composer').directory?
has_configComposerDir = file('/root/.config/composer').directory?

describe file('/usr/local/bin/composer') do
  it { should be_file }
end

describe file('/root/.composer/vendor/hirak/prestissimo/composer.json'), :if => has_composerDir do
  it { should be_file }
end

describe file('/root/.config/composer/vendor/hirak/prestissimo/composer.json'), :if => has_configComposerDir do
  it { should be_file }
end