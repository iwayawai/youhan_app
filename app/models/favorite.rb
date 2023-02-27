class Favorite < ApplicationRecord
  
  belongs_to :member, :recipe
  
end
