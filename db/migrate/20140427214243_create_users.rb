class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email
      t.string :name
      t.timestamps
    end
    connection.execute <<-EOQ
      INSERT INTO users
      (email, name, created_at, updated_at)
      VALUES
      ('pj@illuminatedcomputing.com', 'foobar', now(), now())
    EOQ
  end

  def down
    drop_table :users
  end
end
