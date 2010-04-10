class DropUserColumn < ActiveRecord::Migration
  def self.up
  	remove_column :questions, :votes
  end

  def self.down
  	add_column :questions, :votes, :integer
  end
end
