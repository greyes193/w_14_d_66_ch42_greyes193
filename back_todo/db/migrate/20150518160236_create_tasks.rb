class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :status, null: false
      t.string :priority, null: false
      t.date :date
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
