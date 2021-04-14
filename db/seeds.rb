# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tc1 = TestCase.create({
  summary: "Seed Test Case #{Time.now.to_i}",
  description: "Description #{Time.now.to_i}"
})

TestExecution.create({
  execution_time: Time.now,
  result: 'pass',
  test_case_id: tc1.id
})

# tc with no executions
TestCase.create({
  summary: "Seed Test Case #{Time.now.to_i}",
  description: "Description #{Time.now.to_i}"
})
