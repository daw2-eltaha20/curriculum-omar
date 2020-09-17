class AddInicioToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :inicio, :string
  end
end
