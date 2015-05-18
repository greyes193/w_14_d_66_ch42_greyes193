class Task < ActiveRecord::Base
  belongs_to :category
  validates :title, :length => { :in => 5..250 }
  validates :title, :date, :priority, presence: true
end
