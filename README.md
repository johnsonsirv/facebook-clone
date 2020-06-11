<h1 align="center"> Nzuko - A social networking platform cloned from facebook</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/johnsonsirv/facebook-clone#readme" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
  <a href="https://github.com/johnsonsirv/facebook-clone/graphs/commit-activity" target="_blank">
    <img alt="Maintenance" src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" />
  </a>
  <a href="https://github.com/johnsonsirv/facebook-clone/blob/master/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/github/license/johnsonsirv/facebook-clone" />
  </a>
  <a href="https://twitter.com/vokeugo" target="_blank">
    <img alt="Twitter: vokeugo" src="https://img.shields.io/twitter/follow/vokeugo.svg?style=social" />
  </a>
</p>

<br>

<p>
  This project is a minimal implementation of a social networking app that clones the core features of facebook. The word <i>Nzuko</i> is a local name meaning <em>gathering</em>. Visit the <b><a href="https://nzuko.herokuapp.com" target="_blank">  Live Url  </a></b>.
  
It explores functionalities like:

- Create new account
- Writing posts and comments (text only)
- Liking posts and comments
- Sending / accepting / canceling friend requests
- Notifications for new friend request.
- User authentication using `Devise` and OAuth (omniauth-facebook)
- User authorization for posts and comments
</p>
<p>
  <a href="https://nzuko.herokuapp.com/" target="_blank">
    <img alt="Website" src="./docs/profile-page-1.png" />
  </a>
   <a href="https://nzuko.herokuapp.com/" target="_blank">
    <img alt="Website" src="./docs/fb-timeline.png" />
  </a>
  <a href="https://nzuko.herokuapp.com/" target="_blank">
    <img alt="ERD" src="./docs/facebook-clone ERD.png" />
  </a>
</p>

<br>

### Future implementations:

- Profile management is minimal but will be extended
- Real-time news feed
- Real-time notifications - from new posts, friend request and ads
- Instant Messaging
- Sharing and Tagging of posts
- Support for multimedia content - videos, images and more
- Additional social login - google, instagram

### Built with:

- Ruby 2.4.0
- Rails 5.2.3
- PostgreSQL
- Cucumber & Capybara (Integration tests)
- RSpec (Unit test)
- Devise / Omniauth-facebook (authentication)
- Bootstrap (UI)
- Guard / Figaro
- FactoryBot (FactoryGirl) / Faker

### Installation

##### Clone this repository from your terminal

> `git clone https://github.com/johnsonsirv/facebook-clone.git`

###### Database setup

in your terminal run

> `rake db:setup`
>
> `rake db:migrate db:test:prepare`

###### Run test suite

###### run integration level tests (user stories located in `features/`)

in your terminal run

> `cucumber features`

###### run unit level tests (specs location `spec/`)

in your terminal run

> `rspec spec`

### Usage

on your terminal run

> `rails server`

Visit `localhost://3000`

### Contributor(s)

[Victor Okeugo](https://angel.co/u/victorokeugo/)

- Github: [@johnsonsirv](https://github.com/johnsonsirv)
- Twitter: [@vokeugo](https://twitter.com/@vokeugo/)
- Email: [okeugo.victor.c@gmail.com]()

### Contributing

1. Fork it (https://github.com/johnsonsirv/facebook-clone/fork)
2. Create your feature branch (git checkout -b feature/[choose-a-name])
3. Commit your changes (git commit -m 'What this commit will fix/add')
4. Push to the branch (git push origin feature/[chosen name])
5. Create a new Pull Request
   > You can also create [issues](https://github.com/johnsonsirv/facebook-clone/issues)
