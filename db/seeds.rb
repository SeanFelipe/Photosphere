# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spec1 = Spec.create({
  summary: "Seed Test Case #{Time.now.to_i}",
  description: "Description #{Time.now.to_i}"
})

RunRecord.create({
  exec_time: Time.now,
  result: 'pass',
  spec_id: spec1.id
})

RunRecord.create({
  exec_time: Time.now,
  result: 'fail',
  spec_id: spec1.id
})

# tc with no executions
Spec.create({
  summary: "Seed Test Case #{Time.now.to_i}",
  description: "Description #{Time.now.to_i}"
})
