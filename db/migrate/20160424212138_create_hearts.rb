class CreateHearts < ActiveRecord::Migration
  def change
    create_table :hearts do |t|
      t.references :song, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
