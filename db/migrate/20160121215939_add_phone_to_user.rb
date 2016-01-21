class AddPhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string,   limit:  60
    add_column :users, :role,  :integer,  limit:   2, default: 2
  end
end
