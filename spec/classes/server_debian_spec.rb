
require 'spec_helper'
describe 'nfs::server::debian', type: :class do
  it do
    is_expected.to contain_class('nfs::client::debian')
    is_expected.to contain_class('nfs::server::debian::service')
    is_expected.to contain_package('nfs-kernel-server')
    is_expected.to contain_service('nfs-kernel-server').with('ensure' => 'running')
  end
  context ':nfs_v4 => true' do
    let(:params) { { nfs_v4: true } }

    it do
      is_expected.to contain_service('idmapd').with('ensure' => 'running')
    end
  end

  context 'mountd params set port' do
    let(:params) { { mountd_port: '4711' } }

    it do
      is_expected.to contain_file_line('rpc-mount-options') # .with( 'ensure' => 'present' )
    end
  end
end
