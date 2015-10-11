# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t = Teacher.new(name: "Mrs. Sharky", email: "sharky@example.com", password: "password")
s = Student.new(name: "Billy", email: "billy@example.com", password: "password")
p = Parent.new(name: "Billy's mom", email: "mom@example.com", password: "password")
g = Grade.new(grade: 90, details: "Math homework", date: Date.today)

t.students << s
s.parents << p
s.grades << g

t.save
s.save
p.save
g.save
