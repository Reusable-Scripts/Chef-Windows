directory "D:/ChefFiles/" do
  action :create
end

remote_file "D:/ChefFiles/jre_windows_installer.exe" do
  source node['nexus']['jre_windows_installer'] 
end

windows_package node['PackageName']['JavaRuntime'] do 
	source 'D:/ChefFiles/jre_windows_installer.exe' 
	action :install 
	options '/s /L D:\javainstalllog.txt'
	installer_type :custom
	ignore_failure true
end
