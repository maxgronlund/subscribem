# rspec spec/models/subscribem/account_spec.rb

require 'spec_helper'

module Subscribem
  describe Account do
    #pending "add some examples to (or delete) #{__FILE__}"
    it "can be created with an owner" do
      params = {
              :name => "Test Account",
              :subdomain => "test",
              :owner_attributes => {
              :email => "user@example.com",
              :password => "password",
              :password_confirmation => "password"
      }
    }
    account = Subscribem::Account.create_with_owner(params)
    account.should be_persisted
    account.users.first.should == account.owner
    end
    
    
    it "cannot create an account without a subdomain" do
      account = Subscribem::Account.create_with_owner
      account.should_not be_valid
      account.users.should be_empty
    end

  end
end
