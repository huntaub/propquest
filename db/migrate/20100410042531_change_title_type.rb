class ChangeTitleType < ActiveRecord::Migration
  def self.up
  	change_column :questions, :title, :text
  end

  def self.down
  	change_column :questions, :title, :string
  end
end
