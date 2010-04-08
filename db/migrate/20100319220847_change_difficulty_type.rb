class ChangeDifficultyType < ActiveRecord::Migration
  def self.up
  	remove_column :questions, :difficulty
  	add_column :questions, :d_total, :integer
  	add_column :questions, :d_length, :integer
  end

  def self.down
  	add_column :questions, :difficulty, :text
  	remove_column :questions, :d_total
  	remove_column :questions, :d_length
  end
end
