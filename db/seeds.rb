# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def seed_groups
  GroupApp.delete_all
  GroupApp.create! [
    { name: 'Контакты',
    body: '
      <div>Преподаватель: 8-990-999-99-999</div>',
    fa_icon: 'fas phone-square' },

    { name: 'Viber',
    body: '
      <div> Скачать приложение можно здесь:
        <a href="https://www.viber.com/ru/download/">https://www.viber.com/ru/download/</a>
      </div>',
    fa_icon: 'fab viber' },

    { name: 'WhatsApp',
    body: '
      <div>Скачать приложение можно здесь: 
        <a href="https://www.whatsapp.com/android/?l=ru">https://www.whatsapp.com/android/?l=ru</a>
      </div>',
    fa_icon: 'fab whatsapp' },

    { name: 'Telegram',
    body: '
      <div>Скачать приложение можно здесь: 
        <a href="https://tlgrm.ru/apps">https://tlgrm.ru/apps</a>
      </div>',
    fa_icon: 'fab telegram-plane' }
  ]
end

def seed_students
  Student.delete_all
  30.times do
    Student.create(
      full_name: Faker::Name.unique.name,
      phone: Faker::PhoneNumber.cell_phone,
      address: Faker::Address.full_address,
      work: Faker::Company.name,
      grade: [1,2,3,4].sample,
      driving_hours: [1, 3, 13, 22, 41, 56].sample
    )
  end
end

def seed_instructors
  Instructor.delete_all
  3.times do
    Instructor.create(
      full_name: Faker::Name.unique.name,
      phone: Faker::PhoneNumber.cell_phone,
    )
  end
end

def seed_drivings
  Driving.delete_all
  Driving.create(
    instructor_id: Instructor.first.id,
    student_id: Student.first.id,
    start_date: DateTime.parse("2018/10/09 8:00")
  )
  Driving.create(
    instructor_id: Instructor.first.id,
    student_id: Student.first.id,
    start_date: DateTime.parse("2018/10/09 10:00")
  )
  Driving.create(
    instructor_id: Instructor.first.id,
    student_id: Student.first.id,
    start_date: DateTime.parse("2018/10/09 13:00")
  )
  Driving.create(
    instructor_id: Instructor.first.id,
    student_id: Student.first.id,
    start_date: DateTime.parse("2018/10/09 15:00")
  )

  Driving.create(
    instructor_id: Instructor.last.id,
    student_id: Student.last.id,
    start_date: DateTime.parse("2018/10/10 8:00")
  )
  Driving.create(
    instructor_id: Instructor.last.id,
    student_id: Student.last.id,
    start_date: DateTime.parse("2018/10/10 10:00")
  )
  Driving.create(
    instructor_id: Instructor.last.id,
    student_id: Student.last.id,
    start_date: DateTime.parse("2018/10/10 13:00")
  )
  Driving.create(
    instructor_id: Instructor.last.id,
    student_id: Student.last.id,
    start_date: DateTime.parse("2018/10/10 15:00")
  )
end

# seed_groups
# seed_students
# seed_instructors
# seed_drivings