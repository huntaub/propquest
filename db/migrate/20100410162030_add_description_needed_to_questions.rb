class AddDescriptionNeededToQuestions < ActiveRecord::Migration
  def self.up
  	add_column :questions, :description_needed, :boolean
  end

  def self.down
  	remove_column :questions, :description_needed
  end
end