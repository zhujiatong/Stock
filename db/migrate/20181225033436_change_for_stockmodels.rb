class ChangeForStockmodels < ActiveRecord::Migration[5.2]
  def change
    remove_column :stockmodels ,:score
  end
end
