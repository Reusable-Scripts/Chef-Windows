#
# Cookbook Name:: java
# Recipe:: default
# author::  
# Copyright 2016,
#
# All rights reserved - Do Not Redistribute
#
directory "D:/java/" do
  action :create
end

directory "D:/java/jdk/" do
  action :create
end

directory "D:/java/jdk/new/" do
  action :create
end

remote_file "C:/ChefFiles/1.8.0_71.zip" do
  source node['nexus']['java']
  notifies :run, 'execute[unzip_1.8.0.71]', :immediately
  backup false
end

# directory "D:/ChefFiles/" do
#   action :create
# end

# remote_file "D:/ChefFiles/7za.exe" do
#   source node['nexus']['7zip']
# end

execute "unzip_1.8.0.71" do
  cwd "C:/ChefRemoteFiles/"
  command "7za.exe x C:/ChefFiles/1.8.0_71.zip -oD:/java/jdk/new * -r -y"
  action :nothing
end

