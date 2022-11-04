class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :id,null: false,primary_key: true
      t.string :email,null: false
      t.string :name,null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
