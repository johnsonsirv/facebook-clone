# m-Facebook (Minimlistik Facebook)

This project is a minimalistic implementation of core facebook features. It explores funtionalities like ``creating account``, ``writing posts and comments (text only)``, ``liking and commenting`` on other people's posts, ``sending / accepting / canceling friend requests`` and ``semi-realtime`` friend request notifications.

Profile management is minimal, real-time newsfeed, notifications, ads, and IM are yet to be implemented.

Authentication was done with ``Devise`` and OAuth (omniauth-facebook).

This project was completed in line with standards provided by [Microverse](https://www.microverse.org/ "The Global School for Remote Software Developers!").

### Technology:

* Ruby 2.4.0
* Rails 5.2.3
* PostgreSQL
* Cucumber & Capybara (Integration tests)
*	RSpec-rails (Unit test)
* Devise / Omniauth-facebook (authentication)
* Bootstrap (UI)
* Guard / Figaro
* FactoryBot (FactoryGirl) / Faker

##### Clone Repository
```git clone https://github.com/johnsonsirv/facebook-clone.git```

###### 1. Database setup
in your terminal run
> ``rake db:setup``
>
> ``rake db:migrate db:test:prepare``

###### 2. Run test suite

###### 1.1 integration level tests (cuke scenarios location ``features/``)

in your terminal run 

```cucumber features```

###### 1.2 unit level tests (specs location ``spec/``)

in your terminal run 

``` rspec spec```


##### 3. Deployment

Visit [Live URL](https://nzuko.herokuapp.com)

n localhost
run ```rails server```

Visit ```localhost://3000```

###### How to contribute
1. Fork it (https://github.com/johnsonsirv/facebook-clone/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -m 'What this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen name])
5. Create a new Pull Request
> You can also create [issues](https://github.com/johnsonsirv/facebook-clone/issues)


