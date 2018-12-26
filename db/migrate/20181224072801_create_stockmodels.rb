class CreateStockmodels < ActiveRecord::Migration[5.2]
  def change
    create_table :stockmodels do |t|
      t.string :name
      t.string :picture
      t.string :average
      t.string :variance
      t.string :SP500
      t.string :transaction
      t.string :profit
      t.string :summary

      t.timestamps
    end
  end
end
