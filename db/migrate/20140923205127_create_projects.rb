class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, limit: 60
      t.string :technologies, limit: 255

      t.timestamps
    end
  end
end
