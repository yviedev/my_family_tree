class Relationship < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :relative, class_name: User, optional: true
  belongs_to :relative_type, optional: true

  def relative_type_id_inverse()
    case relative_type_id
      when 1
        relative_type_id = 1
      when 2
        relative_type_id = 3
      when 3
        relative_type_id = 2
      when 4
        relative_type_id = 5
      when 5
        relative_type_id = 4
      when 6
        relative_type_id = 7
      when 7
        relative_type_id = 6
      when 8
        relative_type_id = 8
      when 9
        relative_type_id = 9
      when 19
        relative_type_id = 19
    end
    return relative_type_id
  end

  def self.inverse_relationship (first_relative_type)
    hash = Hash.new
    hash[1] = 1
    hash[2] = 3
    hash[3] = 2
    hash[4] = 5
    hash[5] = 4
    hash[6] = 7
    hash[7] = 6
    hash[8] = 8
    hash[9] = 9
    hash[19] = 19
      
    return hash[first_relative_type]
  end

end
