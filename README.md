TIOJ INFOR Online Judge
==

###Remember to change secret token in production!!!
###NOTE: This project is under heavy development and not usable!!!

## Resources

[Ruby on Rails Guides](http://guides.rubyonrails.org/)

[Ruby on Rails Reading List by XDite](http://blog.xdite.net/posts/2013/01/30/2013-reading-list)

[Ruby on Rails 實戰聖經](http://ihower.tw/rails3/index.html)

###Remember to start mysql server before starting rails

## Test
```bash
$ git clone https://github.com/joshua5201/tioj.git
$ bundle install
$ rake rails:update:bin
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ rails s
```
## Dump SQL
```bash
$ mysqldump tioj_dev -u root -p --opt > tioj_dev00.sql
```

## Restore SQL
```bash
$ mysql -u root -p tioj_dev < tioj_dev.sql
```
## Seed data

```bash
$ bundle exec rake db:seed
```
