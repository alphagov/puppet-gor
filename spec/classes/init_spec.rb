require 'spec_helper'

describe 'gor' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "gor class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('gor::params') }

        it { should contain_class('gor::install') }
        it { should contain_class('gor::config') }
        it { should contain_class('gor::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'gor class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
