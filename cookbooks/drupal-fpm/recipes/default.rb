require_recipe "build-essential"
#require_recipe "mysql::server"
require_recipe "php"
#require_recipe "php::php5-cli"
#include_recipe "php::pear"
#require_recipe "php::module_apc"
require_recipe "php::module_curl"
require_recipe "php::module_gd"
#require_recipe "php::module_xdebug"
require_recipe "php::module_mysql"
  require_recipe "php::module_memcache"
require_recipe "memcached"
require_recipe "imagemagick"
require_recipe "build-essential"
require_recipe "hosts"
#require_recipe "drush"

# Some neat package (subversion is needed for "subversion" chef ressource)
%w{ php5-fpm }.each do |a_package|
  package a_package
end

php_pear "pdo" do
  action :install
end

# Requried to install APC.
package "libpcre3-dev"

# Install APC.
php_pear "apc" do
  directives(:shm_size => 128)
  version "3.1.6" #ARGH!!! debuging enabled on APC builds circa 5/2011. Pin back.
  action :install
end

node[:hosts][:localhost_aliases].each do |site|
  # Configure the development site
  nginx_app site do
    template "sites.conf.erb"
    server_name site
    server_aliases [site]
    docroot "/vagrant/public/#{site}/www"
  end
end

# Add apc conf until we can correctly config apc
#bash "apc_shm_size_conf" do
#  code "echo apc.shm_size = 70 >> /etc/php5/apache2/conf.d/apc.ini"
#  only_if { "grep shm_size /etc/php5/apache2/conf.d/apc.ini" }
#end

# Add an admin user to mysql
#execute "add-admin-user" do
#  command "/usr/bin/mysql -u root -p#{node[:mysql][:server_root_password]} -e \"" +
#      "CREATE USER 'myadmin'@'localhost' IDENTIFIED BY 'myadmin';" +
#      "GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'localhost' WITH GRANT OPTION;" +
#      "CREATE USER 'myadmin'@'%' IDENTIFIED BY 'myadmin';" +
#      "GRANT ALL PRIVILEGES ON *.* TO 'myadmin'@'%' WITH GRANT OPTION;\" " +
#      "mysql"
#  action :run
#  ignore_failure true
#end
