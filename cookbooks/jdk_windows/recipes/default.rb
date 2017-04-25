#
# Cookbook Name:: jdk_windows
# Recipe:: default
#
# Copyright 2017, SelfEmployee
#Owner's' : saikrishnaMa ,PranithaR, R Dama(ycx35)
# All rights reserved - Do Not Redistribute
#
remote_path = node['nexus']['java_url']

directory 'C:\ChefSoftwares' do
    action :create
end

directory 'C:\Java' do
    action :create
end
directory 'C:\Java\x64' do
    action :create
end
directory 'C:\Java\x64\jdk1.8.0_60' do
    action :create
end

directory 'C:\Java\x64\jre1.8.0_60' do
    action :create
end

remote_file 'C:\Java\x64\jdk-8u131-windows-x64.exe' do
    source remote_path
    action :create_if_missing
end


execute "java-install" do
  cwd 'C:\\ChefSoftwares'
  command "call install-jdk.bat"
  action :nothing
end

template 'C:\ChefSoftwares\install-jdk.bat' do
    source 'install-jdk.bat.erb'
    action :create
   notifies :run, 'execute[java-install]', :immediately
end

template 'C:\ChefSoftwares\java-path.bat' do
    source 'JAVA-HOME.bat.erb'
    action :create
   notifies :run, 'batch[java-path]', :immediately
end

batch "java-path" do
  cwd 'C:\\ChefSoftwares\\'
  code "java-path.bat"
  action :nothing
#if the server restart required please uncomment below actions
 # notifies :run, 'reboot[Restart-Computer]', :immediately
end
#reboot 'Restart-Computer' do
 # action :nothing
#end
