class CreateLexicons < ActiveRecord::Migration[5.1]
  def change
    create_table :lexicons do |t|
      t.string :word
      t.string :definition
      t.integer :note_id

      t.timestamps
    end
  end
end
