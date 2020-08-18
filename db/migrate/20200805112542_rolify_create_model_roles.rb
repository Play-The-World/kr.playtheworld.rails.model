class RolifyCreateModelRoles < ActiveRecord::Migration[6.0]
  def change
    create_table(:model_roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:model_users_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end
    
    add_index(:model_roles, :name)
    add_index(:model_roles, [ :name, :resource_type, :resource_id ])
    add_index(:model_users_roles, [ :user_id, :role_id ])
  end
end
