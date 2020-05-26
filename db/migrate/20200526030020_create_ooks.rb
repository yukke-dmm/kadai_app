class CreateOoks < ActiveRecord::Migration[5.2]
  def change
    create_table :ooks do |t|

      t.timestamps
    end
  end
end
