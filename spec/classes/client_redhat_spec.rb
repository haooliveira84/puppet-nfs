require 'spec_helper'
describe 'nfs::client::redhat' do
  let(:params) { { package_ensure: 'installed' } }

  context 'operatingsystemrelease => 7.0' do
    let(:facts) { { operatingsystemrelease: '7.0' } }

    it do
      is_expected.to contain_class('nfs::client::redhat::install')
      is_expected.to contain_class('nfs::client::redhat::configure')
      is_expected.to contain_class('nfs::client::redhat::service')
      is_expected.to contain_service('nfslock').with(
        'ensure' => 'running',
      )
      is_expected.to contain_package('nfs-utils')
      is_expected.to contain_class('nfs::client::redhat')
      is_expected.to contain_package('rpcbind')
      is_expected.to contain_service('rpcbind').with(
        'ensure' => 'running',
      )
    end
  end

  context 'operatingsystemrelease => 6.4' do
    let(:facts) { { operatingsystemrelease: '6.4' } }

    it do
      is_expected.to contain_class('nfs::client::redhat::install')
      is_expected.to contain_class('nfs::client::redhat::configure')
      is_expected.to contain_class('nfs::client::redhat::service')

      is_expected.to contain_service('nfslock').with(
        'ensure' => 'running',
      )
      is_expected.to contain_service('netfs').with(
        'enable' => 'true',
      )
      is_expected.to contain_package('nfs-utils')
      is_expected.to contain_class('nfs::client::redhat')
      is_expected.to contain_package('rpcbind')
      is_expected.to contain_service('rpcbind').with(
        'ensure' => 'running',
      )
    end
  end

  context 'operatingsystemrelease => 3.10.35-43.137.amzn1.x86_64' do
    let(:facts) { { operatingsystemrelease: '3.10.35-43.137.amzn1.x86_64' } }

    it do
      is_expected.to contain_class('nfs::client::redhat::install')
      is_expected.to contain_class('nfs::client::redhat::configure')
      is_expected.to contain_class('nfs::client::redhat::service')

      is_expected.to contain_service('nfslock').with(
        'ensure' => 'running',
      )
      is_expected.to contain_service('netfs').with(
        'enable' => 'true',
      )
      is_expected.to contain_package('nfs-utils')
      is_expected.to contain_class('nfs::client::redhat')
      is_expected.to contain_package('rpcbind')
      is_expected.to contain_service('rpcbind').with(
        'ensure' => 'running',
      )
    end
  end

  context 'operatingsystemrelease => 2' do
    let(:facts) { { operatingsystemrelease: '2' } }

    it do
      is_expected.to contain_class('nfs::client::redhat::install')
      is_expected.to contain_class('nfs::client::redhat::configure')
      is_expected.to contain_class('nfs::client::redhat::service')
      is_expected.to contain_service('nfslock').with(
        'ensure' => 'running',
      )
      is_expected.to contain_package('nfs-utils')
      is_expected.to contain_class('nfs::client::redhat')
      is_expected.to contain_package('rpcbind')
      is_expected.to contain_service('rpcbind').with(
        'ensure' => 'running',
      )
    end
  end

  context 'operatingsystemrelease => 4.1.7-15.23.amzn1.x86_64' do
    let(:facts) { { operatingsystemrelease: '4.1.7-15.23.amzn1.x86_64' } }

    it do
      is_expected.to contain_class('nfs::client::redhat::install')
      is_expected.to contain_class('nfs::client::redhat::configure')
      is_expected.to contain_class('nfs::client::redhat::service')

      is_expected.to contain_service('nfslock').with(
        'ensure' => 'running',
      )
      is_expected.to contain_service('netfs').with(
        'enable' => 'true',
      )
      is_expected.to contain_package('nfs-utils')
      is_expected.to contain_class('nfs::client::redhat')
      is_expected.to contain_package('rpcbind')
      is_expected.to contain_service('rpcbind').with(
        'ensure' => 'running',
      )
    end
  end

  context ':nfs_v4 => true' do
    let(:params) { { nfs_v4: true } }
    let(:facts) { { operatingsystemrelease: '6.4' } }

    it do
      is_expected.to contain_augeas('/etc/idmapd.conf')
    end
  end

  context 'operatingsystemrelease => 5.3' do
    let(:facts) { { operatingsystemrelease: '5.3' } }

    it do
      is_expected.to contain_class('nfs::client::redhat')
      is_expected.to contain_package('portmap')

      is_expected.to contain_service('portmap').with(
        'ensure' => 'running',
      )
    end
  end
end
