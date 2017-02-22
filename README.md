## Freddit

Freddit is a basic reddit clone built using Rails with a JQery front-end. Users can Signup and log in using their email address or using their GitHub credentials via the OmniAuth gem.

Once logged in they can start conversations or join existing ones. freddit uses JQuery to render reply forms and then display the new reply in the DOM using Handlebars templates. Nested replies are implemented using polymorphic associations on the backend.

## Usage

The app can be accessed by firing up the rails server and then visiting localhost:3000 in your browser. A live version will be available on Heroku soon.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/achasveachas/freddit-jq or by email to projects@yechiel.me. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
