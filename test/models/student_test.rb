require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "student name presence" do
    s = Student.new()
    refute s.save
    s2 = Student.new(name: "Bobert", email: "bobert@example.com", password: "iluvapples")
    assert s2.save
  end

  test "student email presence" do
    s = Student.new()
    refute s.save
    s2 = Student.new(name: "Bobert", email: "bobert@example.com", password: "iluvapples")
    assert s2.save
  end

  test "student password presence" do
    s = Student.new()
    refute s.save
    s2 = Student.new(name: "Bobert", email: "bobert@example.com", password: "iluvapples")
    assert s2.save
  end

  test "student email unique" do
    s = Student.create(name: "Earl", email: "lemons@example.com", password: "iluvapples")
    s2 = Student.create(name: "of Lemongrab", email: "lemons@example.com", password: "iluvlemons")
    refute s2.save
  end

  test "student has many parents" do
    s = Student.create(name: "Lumpy", email: "lumpy@example.com", password: "iluvapples")
    p1 = Parent.create(name: "Space", email: "space@example.com", password: "password")
    s.parents << p1
    p2 = Parent.create(name: "Princess", email: "princess@example.com", password: "pass1234")
    assert s.parents << p2
  end

  test "student has many grades" do
    s = Student.create(name: "Lumpy", email: "lumpy@example.com", password: "iluvapples")
    g = Grade.create()
    s.grades << g
    g2 = Grade.create()
    assert s.grades << g2
  end

  test "student has one teacher" do
    before = Teacher.count
    s = Student.create(name: "Lumpy", email: "lumpy@example.com", password: "iluvapples")
    t = Teacher.create(name: "Billy", email: "billy@example.com", password: "password")
    t.students << s

    assert_equal before + 1, Teacher.count
  end
end
