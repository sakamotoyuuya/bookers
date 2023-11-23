FactoryBot.define do
factory :book do
title { Faker::Lorem.characters(number:5) }
body { Faker::Lorem.characters(number:20) }
end
end
it '投稿処理に成功しサクセスメッセージが表示されること' do
visit new_book_path
fill_in 'Title', with: '本のタイトル'
fill_in 'Body', with: '感想'
click_button 'Create Book'
expect(page).to have_content 'successfully'
end