require 'spec_helper'
describe 'nfs::client::debian' do
  let(:facts) do
    facts
  end
  let :pre_condition do
    'include ::nfs::client'
  end

  it do
    is_expected.to contain_class('nfs::client::debian::install')
    is_expected.to contain_class('nfs::client::debian::configure')
    is_expected.to contain_class('nfs::client::debian::service')

    is_expected.to contain_service('rpcbind').with(
      'ensure' => 'running',
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
