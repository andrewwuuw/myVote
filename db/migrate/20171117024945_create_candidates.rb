class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.integer :age

      t.timestamps
    end
  end
end
