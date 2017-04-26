#
# Cookbook Name:: tomcat_windows
# Recipe:: default
#Owner's' : R Dama(ycx356),saikrishnama,PranithaR
# Copyright 2017, SelfEmployee
#
# All rights reserved - Do Not Redistribute
#

remote_path = node['tomcat']['tomcat_url']
zip_url = node['tomcat']['7zip']

directory 'C:\ChefSoftwares' do
    action :create
end

directory 'C:\ChefSoftwares\TomcatApp' do
    action :create
end

directory 'C:\ChefSoftwares\TomcatApp\TomcatService' do
    action :create
end

remote_file 'C:\ChefSoftwares\TomcatApp\7zip.exe' do
    source zip_url
    action :create_if_missing
end
remote_file 'C:\ChefSoftwares\TomcatApp\tomcat.zip' do
    source remote_path
    action :create_if_missing
    notifies :run, 'execute[tomcat.zip]',  :immediately
end


execute 'tomcat.zip' do
  cwd 'C:\\ChefSoftwares\\TomcatApp'
  command "7za.exe x C:\\ChefSoftwares\\TomcatApp\\tomcat.zip -oC:\\ChefSoftwares\\TomcatApp\\TomcatService * -r -y"
  action :nothing
  notifies :run, 'execute[appfileremove]', :immediately
  
end

# batch 'appfileremove' do
#   code <<-EOH
#   cwd "C:\ChefSoftwares\TomcatApp\TomcatService\conf\"

#     EOH
# end

execute 'appfileremove' do
    cwd 'C:\ChefSoftwares\TomcatApp\TomcatService\conf\''
    command 'del  server.xml'
    command 'del  tomcat-user.xml'
    action :nothing
end



template 'C:\ChefSoftwares\TomcatApp\TomcatService\conf\tomcat-user.xml' do
    source 'tomcat-user.xml.erb'
    action :create
    notifies :run, 'batch[run-script]', :immediately
end

template 'C:\ChefSoftwares\TomcatApp\TomcatService\conf\server.xml' do
    source 'server.xml.erb'
    action :create
    notifies :run, 'batch[run-script]', :immediately
end


batch 'run-script' do
    cwd "C:\\ChefSoftwares\\TomcatApp\\TomcatService\\bin"
    command "catalina.bat stop"
    command "catalina.bat start"
    action :nothing
end
