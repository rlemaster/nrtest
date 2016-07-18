class Host < ApplicationRecord
  has_many :events
  belongs_to :org
end
