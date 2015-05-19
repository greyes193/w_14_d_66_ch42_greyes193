class Category < ActiveRecord::Base
	has_many :tasks
	validates :name, presence: true, :length => { :in => 5..50 }, uniqueness: true
end
