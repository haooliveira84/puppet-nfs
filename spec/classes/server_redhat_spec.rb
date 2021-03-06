require 'spec_helper'
describe 'nfs::server::redhat' do
  context 'operatingsystemrelease => 6.4' do
    let(:facts) { { operatingsystemrelease: '6.4', operatingsystemmajrelease: '6' } }

    it do
      is_expected.to contain_class('nfs::client::redhat')
      is_expected.to contain_service('nfs').with('ensure' => 'running')
    end
  end

  context 'operatingsystemrelease => 7.1' do
    let(:facts) { { operatingsystemrelease: '7.1', operatingsystemmajrelease: '7' } }

    it do
      is_expected.to contain_class('nfs::client::redhat')
      is_expected.to contain_class('nfs::server::redhat::service')
      is_expected.to contain_service('nfs-server').with('ensure' => 'running')
    end

    context ':nfs_v4 => true' do
      let(:params) { { nfs_v4: true, nfs_v4_idmap_domain: 'teststring' } }

      it do
        is_expected.to contain_augeas('/etc/idmapd.conf').with_changes(%r{set Domain teststring})
      end
    end

    context 'mountd params set port' do
      let(:params) { { mountd_port: '4711' } }

      it do
        is_expected.to contain_file_line('rpc-mount-options-port') # .with( 'ensure' => 'present' )
      end
    end

    context 'mountd params set threads' do
      let(:params) { { mountd_threads: '11' } }

      it do
        is_expected.to contain_file_line('rpc-mount-options-threads') # .with( 'ensure' => 'present' )
      end
    end
  end
end
