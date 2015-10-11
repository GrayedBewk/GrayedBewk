require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "name presence" do
    t = Teacher.new()
    refute t.save
    u = Teacher.new(name: "Mrs. Applebaum", email: "apples@example.com", password: "iluvapples")
    assert u.save
  end

  test "email presence" do
    t = Teacher.new()
    refute t.save
    u = Teacher.new(name: "Mrs. Applebaum", email: "apples@example.com", password: "iluvapples")
    assert u.save
  end

  test "password presence" do
    t = Teacher.new()
    refute t.save
    u = Teacher.new(name: "Mrs. Applebaum", email: "apples@example.com", password: "iluvapples")
    assert u.save
  end

  test "email unique" do
    t = Teacher.create(name: "Mrs.Applebaum", email: "apples@example.com", password: "iluvapples")
    t2 = Teacher.create(name: "Mrs.Applebaum", email: "apples@example.com", password: "iluvapples")
    refute t2.save
  end

  test "has_many students" do
    t = Teacher.create(name: "Mrs.Applebaum", email: "apples@example.com", password: "iluvapples")
    s = Student.create(name: "Billy", email: "billy@example.com", password: "password")
    t.students << s
    s2 = Student.create(name: "George", email: "george@example.com", password: "pass1234")
    assert t.students << s2
  end

end
