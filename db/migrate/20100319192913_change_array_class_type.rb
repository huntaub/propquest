class ChangeArrayClassType < ActiveRecord::Migration
  def self.up
  	add_column :questions, :difficulty, :text
  end

  def self.down
  	remove_column :questions, :difficulty
  end
 end
