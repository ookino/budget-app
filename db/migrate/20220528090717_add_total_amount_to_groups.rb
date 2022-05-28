class AddTotalAmountToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :total_amount, :integer
  end
end
