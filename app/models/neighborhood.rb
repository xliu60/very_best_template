class Neighborhood < ApplicationRecord
  # Direct associations

  has_many   :venues,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
