class Trait < ApplicationRecord
  default_scope { order("position ASC") }
end
