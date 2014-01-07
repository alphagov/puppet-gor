require 'spec_helper'

describe 'gor' do
  describe '#package_ensure' do
    context 'default' do
      let(:params) {{
        :args => { '--foo' => 'bar' },
      }}

      it { should contain_package('gor').with_ensure('present') }
    end

    context '1.2.3' do
      let(:params) {{
        :args => { '--foo' => 'bar' },
        :package_ensure => '1.2.3',
      }}

      it { should contain_package('gor').with_ensure('1.2.3') }
    end
  end
end
