# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GroupApp.delete_all

GroupApp.create!(
  name: 'Viber',
  body: '
    <div> Скачать приложение можно здесь:
      <a href="https://www.viber.com/ru/download/">https://www.viber.com/ru/download/</a>
    </div>',
  fa_icon: 'fab viber'
)

GroupApp.create!(
  name: 'WhatsApp',
  body: '
    <div>Скачать приложение можно здесь: 
      <a href="https://www.whatsapp.com/android/?l=ru">https://www.whatsapp.com/android/?l=ru</a>
    </div>',
  fa_icon: 'fab whatsapp'
)

GroupApp.create!(
  name: 'Telegram',
  body: '
    <div>Скачать приложение можно здесь: 
      <a href="https://tlgrm.ru/apps">https://tlgrm.ru/apps</a>
    </div>',
  fa_icon: 'fab telegram-plane'
)