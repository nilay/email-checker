class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.string :email, null: false, index: {unique: true}
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.timestamps
    end
  end
end
