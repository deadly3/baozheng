# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# u.password = "123123"                # 最少要六码
#
# u.password_confirmation = "123123"   # 最少要六码
#
# u.is_admin = true
# u.save

puts "这个种子程序会自动建立admin账号, 并且创建6个达人作品products"

create_account = User.create([email: 'admin@1', password: '123123', password_confirmation: '123123', is_admin: 'true', nickname: '🐂👃闪闪'])
create_account = User.create([email: '1@1', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "管理员建立成功."

create_account = User.create([email: 'test@1', password: '123123', password_confirmation: '123123'])
create_account = User.create([email: '2@2', password: '111111', password_confirmation: '111111'])
puts "顾客建立成功"


create_jos = for i in 1..4 do
  Work.create!([user_id: 1, title: "Work no.#{i}", description: "这是用种子程序生产的第 #{i} 个达人作品", price: rand(50..99)*10, is_hidden: "false"])
end
puts "4个公开达人产品 创建成功"

create_jos = for i in 1..2 do
  Work.create!([user_id: 1, title: "Work no.#{i+4}", description: "这是用种子程序生产的第 #{i+4} 个达人作品", price: rand(50..99)*10, is_hidden: "true"])
end
puts "2个未公开达人产品 创建成功"

create_jos = for i in 1..4 do
  Request.create!([user_id: 3, title: "Request no.#{i}", description: "这是用种子程序生产的第 #{i} 个申请"])
end
puts "4个订单 创建成功"

create_jos = for i in 1..4 do
  Request.create!([user_id: 4, title: "Request no.#{i+4}", description: "这是用种子程序生产的第 #{i+4} 个申请"])
end
puts "4个订单 创建成功"
