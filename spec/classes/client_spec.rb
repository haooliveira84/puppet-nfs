require 'spec_helper'

describe 'nfs::client' do
  context 'operatingsysten => ubuntu' do
    let(:facts) { { operatingsystem: 'ubuntu' } }

    it { is_expected.to contain_class('nfs::client::ubuntu') }
  end
  context 'operatingsysten => debian' do
    let(:facts) { { operatingsystem: 'debian' } }

    it { is_expected.to contain_class('nfs::client::debian') }
  end
  context 'operatingsysten => scientific' do
    let(:facts) { { operatingsystem: 'scientific', operatingsystemrelease: '6.4' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => SLC' do
    let(:facts) { { operatingsystem: 'SLC', operatingsystemrelease: '6.4' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => centos v7' do
    let(:facts) { { operatingsystem: 'centos', operatingsystemrelease: '7.0' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => centos v6' do
    let(:facts) { { operatingsystem: 'centos', operatingsystemrelease: '6.4' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => centos v5' do
    let(:facts) { { operatingsystem: 'centos', operatingsystemrelease: '5.4' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => redhat v7' do
    let(:facts) { { operatingsystem: 'redhat', operatingsystemrelease: '7.0' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => redhat v6' do
    let(:facts) { { operatingsystem: 'redhat', operatingsystemrelease: '6.4' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => Amazon v3' do
    let(:facts) { { operatingsystem: 'Amazon', operatingsystemrelease: '3.10.35-43.137.amzn1.x86_64' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => Amazon v4' do
    let(:facts) { { operatingsystem: 'Amazon', operatingsystemrelease: '4.1.7-15.23.amzn1.x86_64' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => Amazon Linux 2' do
    let(:facts) { { operatingsystem: 'Amazon', operatingsystemrelease: '2' } }

    it { is_expected.to contain_class('nfs::client::redhat') }
  end
  context 'operatingsysten => gentoo' do
    let(:facts) { { operatingsystem: 'gentoo' } }

    it { is_expected.to contain_class('nfs::client::gentoo') }
  end
  context 'operatingsystem => darwin' do
    let(:facts) { { operatingsystem: 'darwin' } }

    it do
      expect {
        is_expected.to contain_class('nfs::server::darwin')
      }.to raise_error(Puppet::Error, %r{NFS client is not supported on Darwin})
    end
  end
end
