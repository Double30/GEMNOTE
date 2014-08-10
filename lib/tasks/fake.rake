namespace :fake do
  desc '創造 10 個假分類'
  task categories: :environment do
    10.times do |i|
      Category.create name: "分類 #{i+1}"
    end
  end
end