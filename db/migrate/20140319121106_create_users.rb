class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :device_token
      t.string :phone_number

      t.timestamps
    end
  end
end
