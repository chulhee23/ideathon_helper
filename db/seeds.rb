# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(email:"chulhee@a.a",name:"이철희",password:"asdasd",univ:"국민대")
u1 = User.create(email:"a@a.a",name:"이길동",password:"asdasd",univ:"국민대")
u2 = User.create(email:"a2@a.a",name:"김길동",password:"asdasd",univ:"동국대")
u3 = User.create(email:"a3@a.a",name:"박길동",password:"asdasd",univ:"삼육대")
u4 = User.create(email:"a4@a.a",name:"홍길동",password:"asdasd",univ:"시립대")