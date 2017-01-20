
default.delabootstrap.group                 = "dela"
default.delabootstrap.user                  = "dela"

default.delabootstrap.public_ips            = ['10.0.2.15']
default.delabootstrap.private_ips           = ['10.0.2.15']
default.delabootstrap.systemd               = "true"

default.delabootstrap.version               = "0.0.1-SNAPSHOT"
default.delabootstrap.url                   = "http://snurran.sics.se/hops/dela/delabootstrap-#{node.delabootstrap.version}.jar"
default.delabootstrap.dir                   = "/srv"
default.delabootstrap.base_dir              = node.delabootstrap.dir + "/delabootstrap"
default.delabootstrap.home                  = node.delabootstrap.base_dir + "-" + node.delabootstrap.version
default.delabootstrap.scripts               = %w{ start.sh generic_start.sh stop.sh generic_stop.sh update_binaries.sh}
default.delabootstrap.logs                  = node.delabootstrap.base_dir + "/delabootstrap.log"
default.delabootstrap.pid_file              = "/tmp/delabootstrap.pid"

default.delabootstrap.log_level             = "WARN"
default.delabootstrap.seed                  = nil
default.delabootstrap.port                  = 30000
default.delabootstrap.id                    = 1

