class Task < ActiveRecord::Base
  belongs_to :category
  validates :title, :length => { :in => 3..250 }, uniqueness: true
  validates :status,  inclusion: { in: %w(done undone),
    message: "%{value} El tipo de tarea no esta permitido (solo permite: done y undone)" }
   validates :priority, inclusion: {in: %w(high medium low),
    message: "%{value} Tipo de prioridad no permitida (solo permite: high, medium y low)"}
  validates :title, :status, :date, :priority, presence: true
end
