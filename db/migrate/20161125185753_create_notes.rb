class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :attachment
      t.integer :teaching_id

      t.timestamps
    end
  end
end
