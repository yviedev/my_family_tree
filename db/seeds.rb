# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

array = User.where(group_id: 5)

5.times do
  array.each do |a|
    relative = array.sample
    if a != relative
      relationship = Relationship.new(
        user_id: a,
        relative_id: relative,
        relative_type_id: rand(1..18),
      )
      relationship.save
    end
  end
end

p "Relationships created!"
