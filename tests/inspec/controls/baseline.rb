describe package('curl') do
  it { should be_installed }
end

describe package('git') do
  it { should be_installed }
end

describe service('ssh') do
  it { should be_enabled }
  it { should be_running }
end

describe port(22) do
  it { should be_listening }
end

describe file('/etc/ssh/sshd_config') do
  its('content') { should match /PermitRootLogin no/ }
  its('content') { should match /PasswordAuthentication no/ }
end

describe user('admin') do
  it { should exist }
  it { should have_home_directory '/home/admin' }
  it { should belong_to_group 'sudo' }
end

describe command('ufw status') do
  its('stdout') { should match /Status: active/ }
end

describe file('/var/log/auth.log') do
  it { should be_file }
  it { should be_readable.by('owner') }
end

describe command('uname -r') do
  its('stdout') { should match /5\.\d+\.\d+/ }
end

describe command('df -h') do
  its('stdout') { should match /\/dev\/sda1/ }
end