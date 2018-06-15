class CreateUsers20180615151540453 < Jennifer::Migration::Base
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
