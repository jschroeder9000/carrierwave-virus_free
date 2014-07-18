require 'spec_helper'

describe CarrierWave::VirusFree do
  it 'is not valid when a virus is uploaded' do
    expect(MyModel.new(true, true).valid?).to be_falsey
  end

  it 'is valid when something not infected is uploaded' do
    expect(MyModel.new(true, false).valid?).to be_truthy
  end

  it 'is valid when nothing is uploaded' do
    expect(MyModel.new(false, false).valid?).to be_truthy
  end
end
