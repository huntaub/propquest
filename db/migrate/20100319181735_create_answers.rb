class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :number
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
