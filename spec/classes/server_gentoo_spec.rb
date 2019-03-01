require 'spec_helper'
describe 'nfs::server::gentoo' do
  it do
    is_expected.to contain_class('nfs::client::gentoo')
    is_expected.to contain_class('nfs::server::gentoo::service')
    is_expected.to contain_service('nfs').with('ensure' => 'running')
  end
  context ':nfs_v4 => true' do
    let(:params) { { nfs_v4: true, nfs_v4_idmap_domain: 'teststring' } }

    it do
      is_expected.to contain_augeas('/etc/idmapd.conf').with_changes(%r{set Domain teststring})
    end
  end
end
