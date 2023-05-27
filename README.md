# ながのCAKE

![NaganoCake](https://github.com/dmmwebcamp-8bit/nagano-cake/assets/129575706/f7b32d33-f065-412b-ba80-6c9a0e19d865)


## 概要
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト


## 開発環境
・Ruby 3.1.2p20  
・Ruby on Rails 6.1.7.3  
・SQLite3  
・bootstrap 4.5.2  

### Gem
・devise  
・pry-rails  
・enum_help  
・dotenv-rails  
・kaminari  
・bootstrap5-kaminari-views  


## 実装機能
- __【会員側】__
    - 会員登録、ログイン・ログアウト、退会機能  
    - 商品注文、カート機能  
    - 配送先登録、管理機能（複数登録対応）  
    - 注文履歴管理機能  
    - 商品検索機能（商品名、商品説明での検索対応）  
    - ジャンル別商品表示機能  


- __【管理側】__
    - ログイン・ログアウト機能  
    - 商品登録、管理機能  
    - 会員管理機能   
    - 注文履歴管理機能（会員別表示対応）  
    - 注文、製作ステータス更新機能  
    - ジャンル登録、管理機能  


## 使用方法
```
$ git clone git@github.com:dmmwebcamp-8bit/nagano-cake.git
$ cd nagano-cake
$ rails db:migrate
$ rails db:seed
$ yarn install
$ bundle install
$ rails s
```
__管理画面ログイン（/admin）__  

email: admin@gmail.com  
pass: adminadmin  


## 製作者
- __チーム「はちびっと」__

    - [もってぃ](https://github.com/yuki-nishimoto1109)  
    - [ささまお](https://github.com/mao-tk)  
    - [かっくん](https://github.com/rjablock) 
