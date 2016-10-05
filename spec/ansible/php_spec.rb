require 'spec_helper'

packages = Array[
    'php7.0',
    'php7.0-cli',
    'php7.0-common',
    'php7.0-gd',
    'php7.0-curl',
    'php7.0-mysql',
    'php7.0-intl',
    'php7.0-fpm',
    'php7.0-mcrypt',
    'php7.0-xsl',
    'php7.0-zip',
    'php7.0-mbstring',
    'php7.0-mcrypt'
]

packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end

describe service('php7.0-fpm') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/etc/php/7.0/cli/php.ini') do
  it { should contain 'memory_limit=256M' }
end