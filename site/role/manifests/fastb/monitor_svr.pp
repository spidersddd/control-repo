# This is an example of a product called
# "Fast B" 
# This is a monitoring server for that product.
class role::fastb::monitor_svr {
  include profile::os::base
  include profile::app::icinga
  #  include profile::app::fastb
}