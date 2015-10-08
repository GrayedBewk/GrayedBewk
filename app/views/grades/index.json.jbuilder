json.array!(@grades) do |grade|
  json.extract! grade, :id, :name, :details, :student_id
  json.url grade_url(grade, format: :json)
end
