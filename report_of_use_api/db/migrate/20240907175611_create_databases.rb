class CreateDatabases < ActiveRecord::Migration[7.1]
  def change
    create_table :databases, id: :bigint do |t|
      t.string :name
      t.string :host
      t.integer :port
      t.string :database
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
