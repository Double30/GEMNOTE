namespace :fake do
  desc '創造 10 個分類'
  task categories: :environment do
    Category.create name: "Rails"
    Category.create name: "Ruby"
    Category.create name: "Python"
    Category.create name: "Debug Gem"
    Category.create name: "Style Gem"
    Category.create name: "帳號管理 Gem"
    Category.create name: "Form Gem"
    Category.create name: "My Project"
    Category.create name: "Just like"
    Category.create name: "Funny"
  end
end