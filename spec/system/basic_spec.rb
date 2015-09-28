require 'spec_helper_system'

describe 'basic tests' do
  it 'class should work without errors and be idempotent' do
    pp = <<-EOS
      class { 'gor': }
    EOS

    puppet_apply(pp) do |r|
      expect(r.exit_code).to eq(2)
      r.refresh
      expect(r.exit_code).to be_zero
    end
  end
end
