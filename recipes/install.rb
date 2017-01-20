
include_recipe "java"

group node.delabootstrap.group do
  action :create
  not_if "getent group #{node.delabootstrap.group}"
end

user node.delabootstrap.user do
  home "/home/#{node.delabootstrap.user}"
  system true
  shell "/bin/bash"
  manage_home true
  action :create
  not_if "getent passwd #{node.delabootstrap.user}"
end

group node.delabootstrap.group do
  action :modify
  members ["#{node.delabootstrap.user}"]
  append true
end

directory "#{node.delabootstrap.home}" do
  owner node.delabootstrap.user
  group node.delabootstrap.group
  mode "775"
  action :create
  recursive true
  not_if { File.directory?("#{node.delabootstrap.home}") }
end


directory "#{node.delabootstrap.home}/bin" do
  owner node.delabootstrap.user
  group node.delabootstrap.group
  mode "775"
  action :create
  not_if { File.directory?("#{node.delabootstrap.home}/bin") }
end

directory "#{node.delabootstrap.home}/conf" do
  owner node.delabootstrap.user
  group node.delabootstrap.group
  mode "775"
  action :create
  not_if { File.directory?("#{node.delabootstrap.home}/conf") }
end

directory "#{node.delabootstrap.home}/lib" do
  owner node.delabootstrap.user
  group node.delabootstrap.group
  mode "775"
  action :create
  not_if { File.directory?("#{node.delabootstrap.home}/lib") }
end

for script in node.delabootstrap.scripts do
  template "#{node.delabootstrap.home}/bin/#{script}" do
    source "#{script}.erb"
    owner node.delabootstrap.user
    group node.delabootstrap.group
    mode 0750
  end
end

url = node.delabootstrap.url

remote_file "#{node.delabootstrap.home}/lib/delabootstrap.jar" do
  source url
  retries 2
  owner node.delabootstrap.user
  group node.delabootstrap.group
  mode "0755"
  # TODO - checksum
  action :create_if_missing
end

link node.delabootstrap.base_dir do
  owner node.delabootstrap.user
  group node.delabootstrap.group
  to node.delabootstrap.home
end

if node.delabootstrap.id.nil?
    node.override.delabootstrap.id = Time.now.getutc.to_i
end

if node.delabootstrap.seed.nil?
    node.override.delabootstrap.seed = Random.rand(100000)
end

# hack until groups attrs work in karamel
node.override.delabootstrap.port = 30000
node.override.delabootstrap.id = 1
####

template "#{node.delabootstrap.home}/conf/application.conf" do
  source "application.conf.erb" 
  owner node.delabootstrap.user
  group node.delabootstrap.group
  mode 0750
  variables({
  })
end

template "#{node.delabootstrap.home}/conf/log4j.properties" do
  source "log4j.properties.erb" 
  owner node.delabootstrap.user
  group node.delabootstrap.group
  mode 0750
  variables({
  })
end

