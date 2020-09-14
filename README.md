# README

# Nagano_CAKE
-長野県にある架空の洋菓子店「ながのCAKE」のECデモサイトを練習として作成  
![demo](https://user-images.githubusercontent.com/67945242/93012975-7785f000-f5df-11ea-9535-2578dd24842a.png)


## Dependency
-Ruby on Rails   
-Ruby 2.5.7  
-Rails 5.2.4.3  
-gem 'devise'  
-gem "refile", require: "refile/rails", github: 'manfe/refile'  
-gem "refile-mini_magick"  
-gem 'bootstrap-sass  3.3.6  
-gem 'jquery-rails'  
-gem 'kaminari  1.2.1  
-gem 'font-awesome-sass'  

## Usage
Vagrant環境を構築  
git clone git@github.com:Kaninikutomato-y/Nagano_CAKE.git  
rails s -b 0.0.0.0でサーバーを起動  
ブラウザでlocalhost:3000/にアクセス(GoogleCrome推奨)  
  
-会員側と管理者側でそれぞれログインできます。  
-管理者側は、商品登録・ジャンル登録・会員の情報を編集できたりします。  
-会員側は、カート機能を利用して商品を購入できたりします。  
  
## License
This software is released under the XXX License, see LICENSE.  

## Authors
カニニクトマト(Junji, Kubo, Ino, Maeta)

## References
-注文機能  
https://qiita.com/GreenFingers_tk/items/ed5219e1e0cdd5e5d1b1
  
-カート機能  
https://qiita.com/kenzo-ta/items/b45994c5f3fdd87b6c50
