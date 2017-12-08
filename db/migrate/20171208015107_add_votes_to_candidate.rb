class AddVotesToCandidate < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :counter, :integer, default: 0
  end
end
