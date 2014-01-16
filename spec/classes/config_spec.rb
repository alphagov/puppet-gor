require 'spec_helper'

describe 'gor' do
  let(:upstart_file) { '/etc/init/gor' }

  describe '#args' do
    context 'valid hash' do
      let(:params) {{
        :args => {
          '-input-raw'          => ':80',
          '-output-http-header' => 'User-Agent: gor',
          '-output-http'        => 'http://staging',
        },
      }}

      it 'should configure gor with the correct arguments' do
        should contain_file(upstart_file).with_content(/^exec \/usr\/bin\/gor \\
  -input-raw=':80' \\
  -output-http-header='User-Agent: gor' \\
  -output-http='http:\/\/staging'$/)
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
  end
end
