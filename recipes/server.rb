include_recipe "delabootstrap::_default"

homedir = "/home/#{node.delabootstrap.user}"

kagent_keys "#{homedir}" do
  cb_user "#{node.delabootstrap.user}"
  cb_group "#{node.delabootstrap.group}"
  cb_name "delabootstrap"
  cb_recipe "server"  
  action :get_publickey
end  
