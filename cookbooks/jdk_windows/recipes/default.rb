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

remote_files 'C:\ChefSoftwares\jdk-8u131-windows-x64.exe' do
    source remote_path
    action :create_if_missing
end

template 'C:\ChefSoftwares\install-jdk.bat' do
    source 'install-jdk.erb'
    action :create
   notifies :run, 'batch[java-install]', :immediately
end

script_path = C:\\ChefSoftwares\\jdk-8u131-windows-x64.exe

batch "java-install" do
  cwd 'script_path'
  code "install-jdk.bat"
  action :nothing
end


template 'C:\ChefSoftwares\java-path.bat' do
    source 'JAVA-HOME.erb'
    action :create
   notifies :run, 'batch[java-path]', :immediately
end

batch "java-path" do
  cwd 'script_path'
  code "java-path"
  action :nothing
#if the server restart required please uncomment below actions
 # notifies :run, 'reboot[Restart-Computer]', :immediately
end
#reboot 'Restart-Computer' do
 # action :nothing
#end
