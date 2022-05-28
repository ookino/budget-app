class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }

  after_save :update_groups_total_amount
  after_destroy :update_groups_total_amount

  private

  def update_groups_total_amount
    group = self.group
    group.total_amount = group.entities.sum(:amount)
    group.save
  end
end
