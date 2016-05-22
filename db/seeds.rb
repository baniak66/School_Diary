puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admin@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

Student.all.each do |student|
  (1..12).each { |m| Payment.create(student: student,
                                    month: Date.new(2016,m,1),
                                    payment_term: Date.new(2016,m,15))
                }
end

100.times do
  payment = Payment.find(rand(1..Payment.all.count))
  payment.update_attribute(:day_of_payment, Faker::Date.between(
                            payment.payment_term.prev_day(15),
                            payment.payment_term.next_day(30)))
end

puts "Seeds: done"
