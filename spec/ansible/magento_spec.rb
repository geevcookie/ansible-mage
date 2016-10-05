require 'spec_helper'

describe file('/var/www/app/etc/env.php') do
  it { should be_file }
end

describe file('/etc/cron.d/magento') do
  it { should be_file }
end