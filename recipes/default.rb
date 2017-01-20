include_recipe "delabootstrap::base-default"

# service_name defined in base-default
service_name=node.delabootstrap.service
if node.kagent.enabled == "true" 
   kagent_config service_name do
     service service_name
     log_file "#{node.delabootstrap.logs}"
     config_file "#{node.delabootstrap.home}/conf/application.conf"
   end
end