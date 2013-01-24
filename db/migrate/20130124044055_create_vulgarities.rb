class CreateVulgarities < ActiveRecord::Migration
  def change
    create_table :vulgarities do |t|
      t.string :text

      t.timestamps
    end
  end
end
