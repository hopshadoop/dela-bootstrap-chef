case node.platform
when "ubuntu"
 if node.platform_version.to_f <= 14.04
   node.override.delabootstrap.systemd = "false"
 end
end

if node.delabootstrap.id.nil?
    node.override.delabootstrap.id = Time.now.getutc.to_i
end

if node.delabootstrap.seed.nil?
    node.override.delabootstrap.seed = Random.rand(100000)
end

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

service_name="delabootstrap"

if node.delabootstrap.systemd == "true"

  service service_name do
    provider Chef::Provider::Service::Systemd
    supports :restart => true, :stop => true, :start => true, :status => true
    action :nothing
  end

  case node.platform_family
  when "rhel"
    systemd_script = "/usr/lib/systemd/system/#{service_name}.service" 
  else
    systemd_script = "/lib/systemd/system/#{service_name}.service"
  end

  template systemd_script do
    source "#{service_name}.service.erb"
    owner "root"
    group "root"
    mode 0754
    notifies :enable, resources(:service => service_name)
    notifies :start, resources(:service => service_name), :immediately
  end

  # This is needed so that the service can be started by systemd
  kagent_config "reload_#{service_name}" do
    action :systemd_reload
  end  

else #sysv

  service service_name do
    provider Chef::Provider::Service::Init::Debian
    supports :restart => true, :stop => true, :start => true, :status => true
    action :nothing
  end

  Chef::Log.info "delabootstrap::default step1"

  template "/etc/init.d/#{service_name}" do
    source "#{service_name}.erb"
    owner "root"
    group "root"
    mode 0754
    notifies :enable, resources(:service => service_name), :immediately
    notifies :start, resources(:service => service_name), :immediately
  end

  Chef::Log.info "delabootstrap::default step2"

end

Chef::Log.info "delabootstrap::default step3"

#if node.kagent.enabled == "true" 
#   kagent_config service_name do
#     service service_name
#     log_file "#{node.delabootstrap.home}/delabootstrap.log"
#     config_file "#{node.delabootstrap.home}/conf/application.conf"
#   end
#end

Chef::Log.info "delabootstrap::default completed"
