# Chef-Windows
To store chef cookbooks for windows 

<B>Configuring Chef-Solo </B>

*) Download and install ChefDK in the system.

*) Chef will be installed in C:\opscode\chefdk 

*) Define solo.rb 
<B>
tmp = 'c:/Chef/'

file_cache_path tmp
data_bag_path   File.join(tmp, 'data_bags')
cookbook_path   File.join(tmp, 'site-cookbooks')
role_path       File.join(tmp, 'roles')
</B>

*) Run 'chef-solo -cC:\Chef\solo.rb' 

