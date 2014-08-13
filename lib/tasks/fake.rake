namespace :fake do
  desc '創造 10 個分類'
  task categories: :environment do
    Category.create name: "Rails" ,user_id: '1'
    Category.create name: "Ruby" ,user_id: '1'
    Category.create name: "Python" ,user_id: '1'
    Category.create name: "Debug Gem" ,user_id: '1'
    Category.create name: "Style Gem" ,user_id: '1'
    Category.create name: "帳號管理 Gem" ,user_id: '1'
    Category.create name: "Form Gem" ,user_id: '1'
    Category.create name: "My Project" ,user_id: '1'
    Category.create name: "Just like" ,user_id: '1'
    Category.create name: "Funny" ,user_id: '1'
  end
end