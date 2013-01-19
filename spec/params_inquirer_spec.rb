require 'spec_helper'

describe ParamsInquirer::Parameters do
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
  end
end
