require 'spec_helper'
describe 'nfs::client::ubuntu' do
  let(:params) { { package_ensure: 'installed' } }

  it do
    is_expected.to contain_class('nfs::client::ubuntu::install')
    is_expected.to contain_class('nfs::client::ubuntu::configure')
    is_expected.to contain_class('nfs::client::ubuntu::service')

    is_expected.to contain_service('rpcbind').with(
      'ensure' => 'running',
    )

    is_expected.to contain_service('idmapd').with(
      'ensure' => 'stopped',
    )
    is_expected.to contain_package('nfs-common')
    is_expected.to contain_package('rpcbind')

    is_expected.to contain_package('nfs4-acl-tools')
  end
  context ':nfs_v4 => true' do
    let(:params) { { nfs_v4: true } }

    it do
      is_expected.to contain_augeas('/etc/idmapd.conf')
      is_expected.to contain_service('idmapd').with(
        'ensure' => 'running',
      )
    end
  end
end
