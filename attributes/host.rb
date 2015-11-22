# packages to install as kvm host
case node['platform_family']
when 'debian'
  if (node['platform'] == 'ubuntu' && node['platform_version'].to_i >= 12) \
  or (node['platform'] == 'debian' && node['platform_version'].to_i <= 7)
    default['kvm']['host']['service_name'] = 'libvirt-bin'
  else
    default['kvm']['host']['service_name'] = 'libvirtd'
  end
  default['kvm']['host']['packages']       = %w(qemu-kvm libvirt-bin)
when 'rhel'
  default['kvm']['host']['service_name']   = 'libvirtd'
  default['kvm']['host']['packages']       = %w(qemu-kvm libvirt)
else
  fail 'unsupported platform'
end
