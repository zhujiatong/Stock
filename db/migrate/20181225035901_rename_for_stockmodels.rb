class RenameForStockmodels < ActiveRecord::Migration[5.2]
  def change
    rename_column :stockmodels ,:transaction,:trade
  end
end
