
default.delabootstrap.version               = "0.0.1-SNAPSHOT"
default.delabootstrap.group                 = "dela"
default.delabootstrap.user                  = "dela"
default.delabootstrap.url                   = "http://snurran.sics.se/hops/dela/dela-bootstrap-#{node.delabootstrap.version}.jar"
default.delabootstrap.dir                   = "/srv"
default.delabootstrap.base_dir              = node.stun.dir + "/stun"
default.delabootstrap.home                  = node.stun.base_dir + "-" + node.stun.version

default.delabootstrap.port                  = 30000

default.delabootstrap.public_ips            = ['10.0.2.15']
default.delabootstrap.private_ips           = ['10.0.2.15']

default.delabootstrap.scripts               = %w{ start.sh stop.sh update_binaries.sh}

default.delabootstrap.logs                  = node.stun.base_dir + "/delabootstrap.log"
default.delabootstrap.log_level             = "WARN"

default.delabootstrap.pid_file              = "/tmp/delabootstrap.pid"

default.delabootstrap.id                    = nil
default.delabootstrap.seed                  = nil

default.delabootstrap.systemd               = "true"

