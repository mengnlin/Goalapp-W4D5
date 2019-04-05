# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  #validations
  describe "validations" do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_presence_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6)}
  end
  #associations
  describe "associations" do  
    it {should have_many :goals}
    it {should have_many :comments}
    it {should have_many :views}
  end 

  describe 'methods and other features' do  
    subject(:user) {FactoryBot.build(:user)}
    
    it 'assigns a custom session token' do  
      expect(user.session_token).not_to be_nil 
    end 

    it 'does not save password to database' do    
      user.save!  
      user_found=User.find(user.id) 
      expect(user_found.password).to be_nil 
    end  
  end 

  describe 'class methods' do    
    subject(:user) {FactoryBot.build(:user)}
    before(:each) do 
      user.save!
    end  
    it 'find user by username and password' do    
      expect(User.find_by_credentials(user.username,user.password)).to eq(user)
    end 

    it 'fails with incorrect username' do    
      expect(User.find_by_credentials('abc',user.password)).to be_nil
    end   

    it 'fails with incorrect password' do    
      expect(User.find_by_credentials(user.username,'')).to be_nil
    end 

  end   
  #methods
end
