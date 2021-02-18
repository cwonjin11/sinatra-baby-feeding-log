# Sinatra Baby Feeding Log

A simple Sinatra-powered web application created to track your baby feeding logs.

This app could be used for:
* adding/editing multiple babies with names and ages
* tracking babies' logs by feeding types, times and amount.
* busy parents who can not remember all feeding time
* Following baby's feeding habits everyday

This project was created as part of the [Flatiron School's Online Web Developer program](https://flatiron-school.com).

For more information about how the project was created, visit [my blog](https://dev.to/cwonjin11/basic-knowledge-of-building-sinatra-crud-app-5em3-temp-slug-4041477?preview=29ec7a42a7e4a3be97db848c7c19ed50dbfb47bf40c9a2ed532d4ab6c02f94ad49a5fff4c8a58aa43e248bb9384387fea36cc5776583f69542f7ccf7 ) and watch the demo video[demo video]( ).

## Install Instructions

Visit [Sinatra Baby Feeding Log](https://.com/) to begin using the app.

Alternatively, clone this repo, run `bundle install`, `rake db:migrate`, and then run `shotgun`.

For added security when cloning the repo, generate your own session secret:

1. Comment out the current session_secret in the Application Controller and un-comment the `ENV.fetch('SESSION_SECRET')`.
2. Create a new .env file by running `touch .env` in your terminal
3. Use the [session_secret_generator gem](https://github.com/DakotaLMartinez/session_secret_generator), included in this project's Gemfile, by running `generate_secret` in the terminal.
4. Copy the secret from your terminal output and paste into your `.env` file locally. It should look something like this in your .env file:

`SESSION_SECRET=8ad90be1a5a9aaaf04a0a99d8efb42c825f16b8fef603f65b600c91d66a17bdd520099130ed70669409a524a97c8f62e9434a0ad102624f9bcff0832e3c2f568`

**NOTE** Don't use this secret!!! The secret you use should be kept private and out of version control or anywhere else publicly accessible.

## Contributors Guide

Bug reports and pull requests are welcome on GitHub at https://github.com/cwonjin11/sinatra-baby-feeding-log. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).