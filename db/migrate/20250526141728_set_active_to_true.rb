class SetActiveToTrue < ActiveRecord::Migration[7.1]
  def change
    change_column_default :listings, :active, to: true
  end
end
