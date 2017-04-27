directory node['artifactory']['initial'] do
  action :create
  recursive true
  ignore_failure true
end
 
directory node['artifactory']['installpath'] do
  action :create
  recursive  true
  ignore_failure true
end
 
 
remote_file "#{node['artifactory']['installpath']}/#{node['artifactory']['zipext']}" do
  source node['artifactory']['7zip']
  action :create_if_missing
  end
 
 
remote_file "#{node['artifactory']['installpath']}/#{node['artifactory']['tomcatpkg']}" do
  source node['artifactory']['TomcatURL']
  action :create_if_missing
notifies :run, 'execute[tomcatunzip]', :immediately
  end
 
execute 'tomcatunzip' do
cwd "#{node['artifactory']['installpath']}"
command "#{node['artifactory']['zipext']} x #{node['artifactory']['installpath']}/#{node['artifactory']['tomcatpkg']} -o#{node['artifactory']['installpath']}/#{node['artifactory']['sfolder']} -r -y"
action :nothing
end
