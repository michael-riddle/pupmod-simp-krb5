require 'spec_helper'

describe 'krb5::keytab' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts[:server_facts] = server_facts_hash unless (Gem::Version.new(Puppet.version) >= Gem::Version.new('5.0.0'))
          facts
        end

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to create_class('krb5::keytab') }
        it { is_expected.to create_file('/etc/krb5_keytabs') }
      end
    end
  end
end
