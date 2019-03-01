require 'spec_helper'
describe 'nfs::client::gentoo' do
  let(:params) { { package_ensure: 'installed' } }

  it do
    is_expected.to contain_class('nfs::client::gentoo')
    is_expected.to contain_class('nfs::client::gentoo::install')
    is_expected.to contain_class('nfs::client::gentoo::configure')
    is_expected.to contain_class('nfs::client::gentoo::service')

    is_expected.to contain_package('net-nds/rpcbind')
    is_expected.to contain_package('net-fs/nfs-utils')
    is_expected.to contain_package('net-libs/libnfsidmap')
  end

  context ':nfs_v4 => true' do
    let(:params) { { nfs_v4: true } }

    it do
      is_expected.to contain_augeas('/etc/conf.d/nfs')
      is_expected.to contain_augeas('/etc/idmapd.conf')
    end
  end
end
