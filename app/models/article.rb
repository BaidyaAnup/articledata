class Article < ActiveRecord::Base
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates :gender, inclusion: %w(male female)
	validates :interest, presence:true
	validates :city, presence:true
	validates :state, presence:true, if: "!state.nil?"
	validates :country, presence: true, if: "!country.nil?"

end
	  
