# README

Before you can enter; however, please follow the steps below: 
1. Ensure you have **Ruby 2.7.4** and **Rails 5.2.8.1**
1. In the terminal type `bundle install`
1. Then type `rails db:create`, then `rails db: migrate`, and then `rails db: seed` 
1. Then type `rails server`
1. In your brower navigate to `http://localhost:3000/`
1. Look through the site, click on links, and try to update/create new artifacts & exhibits!
1. Now, back in the terminal type `control C` to exit the server
1. Then type `bundle exec rspec spec/models` to see all model tests passing
1. Then type `bundle exec rspec spec/features` to see all feature tests passing
1. If you'd like to see a webpage of the SimpleCove test coveraage: 

-For coverage report: In the mac terminal type `bundle exec rspec` and then `open coverage/index.html`

* ...
![image text](https://cloud.githubusercontent.com/assets/711743/25648417/57cd2c0c-2fe9-11e7-8753-b60ea2656faf.png)
