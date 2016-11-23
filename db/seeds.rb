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

puts "这个种子程序会自动建立admin账号, 并且创建6个达人作品"

create_account = User.create([email: "admin@1", password: "123123",
   password_confirmation: "123123", is_admin: true , :is_designer => true, nickname: "达人1", token: "f5dbe66e3408e0be"])
create_account = User.create([email: "1@1", password: "111111",
   password_confirmation: "111111", is_admin: false, :is_designer => true , nickname: "达人2", token: "ewdbe66e3408e0be"])
create_account = User.create([email: "2@2", password: "111111",
   password_confirmation: "111111", is_admin: true, :is_designer => true,  nickname: "达人3", token: "f5dwe66e3408e0be"])
puts "管理员建立成功."

create_account = User.create([email: "test@1", password: "123123", password_confirmation: "123123", nickname: "申请者1", token: "hgdbe66e3408e0be"])
create_account = User.create([email: "3@3", password: "111111", password_confirmation: "111111", nickname: "申请者2", token: "f5dbeeee3408e0be"])
create_account = User.create([email: "4@4", password: "111111", password_confirmation: "111111", nickname: "申请者3", token: "f5dbedfe3408e0be"])
puts "顾客建立成功"


create_jos = for i in 1..4 do
  Work.create!([user_id: 1, title: "作品#{i}", description: "这是用种子程序生产的第 #{i} 个达人作品", price: rand(50..99)*10, is_hidden: "false"])
end

create_jos = for i in 1..4 do
  Work.create!([user_id: 2, title: "作品#{i}", description: "这是用种子程序生产的第 #{i} 个达人作品", price: rand(50..99)*10, is_hidden: "false"])
end

create_jos = for i in 1..4 do
  Work.create!([user_id: 3, title: "作品#{i}", description: "这是用种子程序生产的第 #{i} 个达人作品", price: rand(50..99)*10, is_hidden: "false"])
end
puts "给每个达人建立4个公开作品 创建成功"

create_jos = for i in 1..2 do
  Work.create!([user_id: 1, title: "作品#{i+4}", description: "这是用种子程序生产的第 #{i+4} 个达人作品", price: rand(50..99)*10, is_hidden: "true"])
end

create_jos = for i in 1..2 do
  Work.create!([user_id: 2, title: "作品#{i+4}", description: "这是用种子程序生产的第 #{i+4} 个达人作品", price: rand(50..99)*10, is_hidden: "true"])
end

create_jos = for i in 1..2 do
  Work.create!([user_id: 3, title: "作品#{i+4}", description: "这是用种子程序生产的第 #{i+4} 个达人作品", price: rand(50..99)*10, is_hidden: "true"])
end
puts "给每个达人建立2个未公开作品 创建成功"

create_jos = for i in 1..4 do
  Request.create!([user_id: 4, title: "订单#{i}", description: "这是用种子程序生产的第 #{i} 个申请"])
end

create_jos = for i in 1..4 do
  Request.create!([user_id: 5, title: "订单#{i+4}", description: "这是用种子程序生产的第 #{i} 个申请"])
end

create_jos = for i in 1..4 do
  Request.create!([user_id: 6, title: "订单#{i+8}", description: "这是用种子程序生产的第 #{i+4} 个申请"])
end
puts "4个订单 创建成功"
