require 'spec_helper'

describe 'nfs::client::mount', type: :define do
  context 'Mount created by exported resource' do
    let(:title) { 'shared /srv/test by nfs.int.net' }
    let(:facts) { { operatingsystem: 'ubuntu', clientcert: 'test.example.com' } }
    let(:params) do
      {
        server: 'nfs.int.net',
        share: '/srv/share',
        mount: '/srv/share',
      }
    end

    it do
      is_expected.to compile
      is_expected.to contain_class('nfs::client')
      is_expected.to contain_mount('shared nfs.int.net:/srv/share by test.example.com /srv/share')
    end
  end

  context 'Mount manually set' do
    let(:title) { '/srv/test' }
    let(:facts) { { operatingsystem: 'ubuntu', clientcert: 'test.example.com' } }
    let(:params) { { server: 'nfs.int.net', share: '/srv/share' } }

    it do
      is_expected.to compile
      is_expected.to contain_class('nfs::client')
      #      should contain_mount('shared nfs.int.net:/srv/share by test.example.com /srv/test')
      # should contain_mount('/srv/test')
    end
  end
end
