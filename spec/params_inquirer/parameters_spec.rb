require 'spec_helper'

describe ParamsInquirer::Parameters do
  describe '#initialize' do
    it 'generates instance from other Hash' do
      params = described_class.new({ key: 'value' })
      params[:key].should be_value
    end

    it 'generates instance from other HashWithIndifferentAccess' do
      hash = ActiveSupport::HashWithIndifferentAccess.new({ key: 'value' })
      params = described_class.new(hash)
      params[:key].should be_value
    end
  end

  describe '#[]=' do
    let(:params) { described_class.new }

    it 'generates an inquirer from String' do
      params[:key] = 'value'
      params[:key].should be_value
    end

    it 'generates an inquirer from Symbol' do
      params[:key] = :value
      params[:key].should be_value
    end

    it 'generates a nested inquirer from Hash' do
      params[:key1] = { key2: 'value' }
      params[:key1][:key2].should be_value
    end

    it 'generates a nested inquirer from blank Hash' do
      params[:key1] = {}
      params[:key1][:key2] = 'value'
      params[:key1][:key2].should be_value
    end
  end
end
