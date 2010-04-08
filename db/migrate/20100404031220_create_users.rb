class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
    add_column :questions, :user_id, :integer
  end

  def self.down
    drop_table :users
    remove_column :questions, :user_id
  end
end
