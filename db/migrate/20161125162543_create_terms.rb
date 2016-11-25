class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :year
      t.string :season

      t.integer :school_id

      t.timestamps
    end
  end
end
