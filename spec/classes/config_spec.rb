require 'spec_helper'

describe 'gor' do
  let(:upstart_file) { '/etc/init/gor.conf' }

  describe '#args' do
    context 'valid hash, non-alphabetical order' do
      let(:params) {{
        :args => {
          '-output-http-header' => 'User-Agent: gor',
          '-output-http'        => 'http://staging',
          '-input-raw'          => ':80',
        },
      }}

      it 'should configure gor with the correct arguments' do
        should contain_file(upstart_file).with_content(/^exec \/usr\/bin\/gor \\
  -input-raw=':80' \\
  -output-http='http:\/\/staging' \\
  -output-http-header='User-Agent: gor'$/)
      end
    end

    context 'multiple values' do
      let(:params) {{
        :args => {
          '-input-raw'          => ':80',
          '-output-http'        => 'http://staging',
          '-output-http-method' => [
            'GET', 'HEAD', 'OPTIONS'
          ],
        },
      }}

      it 'should configure gor with the correct arguments' do
        should contain_file(upstart_file).with_content(/^exec \/usr\/bin\/gor \\
  -input-raw=':80' \\
  -output-http='http:\/\/staging' \\
  -output-http-method='GET' \\
  -output-http-method='HEAD' \\
  -output-http-method='OPTIONS'$/)
      end
    end

    context 'not a hash' do
      let(:params) {{
        :args => 'somestring',
      }}

      it do
        expect { should }.to raise_error(Puppet::Error, /is not a Hash/)
      end
    end

    context 'empty hash' do
      let(:params) {{
        :args => {},
      }}

      it do
        expect { should }.to raise_error(Puppet::Error, /args param is empty/)
      end
    end

    context 'hash with empty values' do
      let(:params) {{
        :args => {
          '-input-raw'          => ':80',
          '-output-http'        => '',
          '-output-http-method' => [
            'GET', 'HEAD', 'OPTIONS'
          ],
        },
      }}

      it do
        expect { should }.to raise_error(Puppet::Error, /args param is empty/)
      end
    end
  end
end
