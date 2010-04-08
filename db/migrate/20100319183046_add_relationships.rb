class AddRelationships < ActiveRecord::Migration
  def self.up
  	add_column :questions, :section_id, :integer
  	add_column :questions, :answer_id, :integer
  	add_column :answers, :section_id, :integer
  end

  def self.down
  	remove_column :questions, :section_id
  	remove_column :questions, :answer_id
  	remove_column :answers, :section_id
  end
end
