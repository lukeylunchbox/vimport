class Proposal < ApplicationRecord
  belongs_to :User
  belongs_to :Category
end
