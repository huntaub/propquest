class AddVotingBack < ActiveRecord::Migration
  def self.up
  	add_column :questions, :vote_int, :integer, :default => 0
  end

  def self.down
  	remove_column :questions, :vote_int
  end
end
