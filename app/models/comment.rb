class Comment < ApplicationRecord
  
  belongs_to :member, :recipe
  
end
