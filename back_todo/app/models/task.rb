class Task < ActiveRecord::Base
  belongs_to :category
  validates :title, :length => { :in => 5..250 }
  validates :status, :length => { :in => 4..12 }
  validates :title, :status, :date, :priority, presence: true
end
