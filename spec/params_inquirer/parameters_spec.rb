require 'spec_helper'

describe ParamsInquirer::Parameters do
  describe '#initialize' do
    it 'generates instance from other hash' do
      params = described_class.new({ key: 'value' })
      params[:key].should be_value
    end
  end

  describe '#[]=' do
    let(:params) { described_class.new }

    context 'when string is given' do
      it 'generates an inquirer' do
        params[:key] = 'value'
        params[:key].should be_value
      end
    end

    context 'when symbol is given' do
      it 'generates an inquirer' do
        params[:key] = :value
        params[:key].should be_value
      end
    end

    context 'when hash is given' do
      it 'generates a nested inquirer' do
        params[:key1] = { key2: 'value' }
        params[:key1][:key2].should be_value
      end
    end

    context 'when blank hash is given' do
      it 'generates a nested inquirer' do
        params[:key1] = {}
        params[:key1][:key2] = 'value'
        params[:key1][:key2].should be_value
      end
    end
  end
end
