class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :faculty
      t.string :number
      t.string :name

      t.integer :school_id

      t.timestamps
    end
  end
end
