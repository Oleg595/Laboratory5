class Company < ApplicationRecord
  has_many :jobs

  def delete_company
    self.update(deleted: true)
  end
end
