class Category < ActiveRecord::Base
	has_many :tasks
	validates :name, presence: true, :length => { :in => 5..15 }
end
