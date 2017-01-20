name             "delabootstrap"
maintainer       "Jim Dowling"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs delabootstrap server'
version          "0.0.1"

recipe            "delabootstrap::install",       "Install delabootstrap binaries"
recipe            "delabootstrap::default",       "Starts the delabootstrap server "
recipe            "delabootstrap::pkey-provider", "Enables the server as public key provider so that you can ssh into others from it"
recipe            "delabootstrap::purge",         "Stops the delabootstrap server and deletes all its files"

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

depends "java"
depends "kagent"
depends "conda"

##### karamel/chef
attribute "java/jdk_version",
          :description => "Version of Java to use (e.g., '7' or '8')",
          :type => "string"

attribute "kagent/enabled",
          :description => "'true' by default",
          :type => "string"

##### install
attribute "install/dir",
          :description => "Default ''. Set to a base directory under which all hops services will be installed.",
          :type => "string"

attribute "install/user",
          :description => "User to install the services as",
          :type => "string"
          
attribute "delabootstrap/group",
          :description => "group parameter value",
          :type => "string"

attribute "delabootstrap/user",
          :description => "user parameter value",
          :type => "string"

attribute "delabootstrap/dir",
          :description => "Base directory for delabootstrap installation (default: '/srv')",
	  :type => "string"

##### app
attribute "delabootstrap/log_level",
          :description => "Default: WARN. Can be INFO or DEBUG or TRACE or ERROR.",
          :type => "string"
          
attribute "delabootstrap/id",
          :description => "id for the delabootstrap instance. Randomly generated, but can be ovverriden here.",
          :type => "string"


attribute "delabootstrap/port",
         :description => "internal delabootstrap server port.",
         :type => "string"
         
attribute "delabootstrap/seed",
          :description => "seed for the dela instance. Randomly generated, but can be ovverriden here.",
          :type => "string"