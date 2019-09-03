# This section will check repo provided keys in the demo/example
# control-repo and warn if they are still in use.
class profile::app::puppet::check_hiera_keys {

  $hiera_private_key = '/etc/puppetlabs/code/environments/production/keys/private_key.pkcs7.pem'
  $hiera_private_key_exists = inline_template("<% if File.exist?('${hiera_private_key}') -%>true<% end -%>")

  if $hiera_private_key_exists {
    $warning_content = "${hiera_private_key} file should be removed from the control repo!\n \
    Any eyaml encrypted data should be re-encrypted with new keys.  DO NOT PLACE PRIVATE KEY in control-repo!\n \
    See https://github.com/voxpupuli/hiera-eyaml#generate-keys"

    warning($warning_content)
    notify { 'key error':
      message => $warning_content,
    }
  }

}
