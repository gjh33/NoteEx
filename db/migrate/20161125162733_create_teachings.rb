class CreateTeachings < ActiveRecord::Migration[5.0]
  def change
    create_table :teachings do |t|
      t.integer :teacher_id
      t.integer :course_id
      t.integer :term_id

      t.timestamps
    end
  end
end
