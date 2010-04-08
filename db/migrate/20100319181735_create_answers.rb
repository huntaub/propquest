class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :number
      t.string :description

      t.timestamps
    end
    remove_column :sections, :answers
  end

  def self.down
    drop_table :answers
    add_column :sections, :answers, :array
  end
end
