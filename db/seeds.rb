# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do |i|
  name = "User #{i+1}"
  username = "user#{i+1}"
  password = "password"
  User.create!(
    name: name,
    username: username,
    password: password
  )
end


# puts 'User created successfully'

# TopupHistory.create!(
#   amount: 1300000,
#   user_id: 3,
#   status: 'success'
#   )


