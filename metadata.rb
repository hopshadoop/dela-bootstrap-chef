name             "delabootstrap"
maintainer       "Jim Dowling"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs delabootstrap server'
version          "0.1.0"

recipe            "delabootstrap::install", "Install delabootstrap binaries"
recipe            "delabootstrap::default", "Starts the delabootstrap server simple mode"
recipe            "delabootstrap::server", "Starts the delabootstrap server as master"
recipe            "delabootstrap::purge",  "Stops the delabootstrap server and deletes all its files"

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

depends "kagent"
depends "java"

attribute "delabootstrap/group",
          :description => "group parameter value",
          :type => "string"

attribute "delabootstrap/user",
          :description => "user parameter value",
          :type => "string"

attribute "delabootstrap/dir",
          :description => "Base directory for delabootstrap installation (default: '/srv')",
	  :type => "string"

attribute "java/jdk_version",
          :description => "Version of Java to use (e.g., '7' or '8')",
          :type => "string"

attribute "delabootstrap/ip",
         :description => "delabootstrap server ip.",
         :type => "string"

attribute "delabootstrap/port",
         :description => "delabootstrap server port.",
         :type => "string"

attribute "delabootstrap/id",
          :description => "id for the delabootstrap instance. Randomly generated, but can be ovverriden here.",
          :type => "string"

attribute "delabootstrap/seed",
          :description => "seed for the dela instance. Randomly generated, but can be ovverriden here.",
          :type => "string"

attribute "delabootstrap/log_level",
          :description => "Default: WARN. Can be INFO or DEBUG or TRACE or ERROR.",
          :type => "string"

