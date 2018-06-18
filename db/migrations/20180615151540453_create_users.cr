class CreateUsers20180615151540453 < Jennifer::Migration::Base
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
    end

    # change_table(:users) do |t|
      # t.change_column(:id, :bigint, {null: false})
    # end
  end

  def down
    drop_table :users
  end
end
