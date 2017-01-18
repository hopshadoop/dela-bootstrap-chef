include_recipe "delabootstrap::_default"

homedir = "/home/#{node.delabootstrap.user}"

homedir = "/home/#{node.delabootstrap.user}"
Chef::Log.info "Home dir is #{homedir}. Generating ssh keys..."

kagent_keys "#{homedir}" do
  cb_user node.delabootstrap.user
  cb_group node.delabootstrap.group
  action :generate  
end  

kagent_keys "#{homedir}" do
  cb_user "#{node.delabootstrap.user}"
  cb_group "#{node.delabootstrap.group}"
  cb_name "delabootstrap"
  cb_recipe "server"  
  action :get_publickey
end  
