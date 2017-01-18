bash 'kill_running_interpreters' do
    user "root"
    ignore_failure true
    code <<-EOF
      service delabootstrap stop
    EOF
end


directory node.delabootstrap.home do
  recursive true
  action :delete
  ignore_failure true
end

link node.delabootstrap.base_dir do
  action :delete
  ignore_failure true
end


