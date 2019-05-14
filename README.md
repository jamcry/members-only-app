# MembersOnly App

This is a members-only blogish app where guest can read all the posts, but
they should be a logged in member to see the authors of those posts.

It is developed using Ruby on Rails.
Also, the user authentication system is written from scratch.

_This project is a part of
[the Odin Project](https://www.theodinproject.com)'s curriculum._

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

If you want to load sample users and posts, use seeds:

```
$ rails db:seed
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
