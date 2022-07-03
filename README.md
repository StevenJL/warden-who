## Intro

- Similar to the unix `who` command but for ruby web applications using `warden` for authentication.
- Gets list of users who are (most likely) logged in.

## How to Use

```rb
# Assuming the authentication model is `User`

Warden::Who.list(User)
# returns list of user_ids who are currently logged in
```

## Set Up

- The list of logged-in user ids is stored in redis.
- Then just gem install

```rb
gem install warden-who
```

- Set up with the initializer code (ie. in `config/initializers` if Rails application)
```rb
require "warden-who"

Warden::Who.set_cache(Redis.new(ENV["REDIS_URL"])
```

## How it Works
- This gem plugs into the `warden` `after_authentication` and `before_logout` hooks to track users who are currently logged in.
- As such, there will be edgecases where this gem will miss such as:
  - users clearing cookies
  - users logging in/out on multiple devices

