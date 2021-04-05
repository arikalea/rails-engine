require 'rails_helper'

RSpec.describe "Merchants API" do
  describe 'All Merchants' do
    describe 'happy path' do
      it 'gives a list of all merchants, limited to 20' do
        create_list(:merchant, 25)

        get '/api/v1/merchants'

        expect(response).to be_successful
      end   
    end
  end
end
