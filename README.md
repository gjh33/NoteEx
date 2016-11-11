# NoteEx

## Installation

1. Install ruby 2.3.1
2. Check if you have bundler by typing "bundle" in your command line. If no, run `gem install bundler`
3. Clone this project to your computer
4. cd into the project directory and run `bundle install`
5. test it's working by running `rails s` on going to your browser and visiting localhost:3000

## Development

For simplicity I put all the views under one directory. To find your html document, go to app/views/basic/

The routes can be seen by running `bundle exec rake routes` from the project directory. Take note of the prefix column.

your html documents can dynamically get info from the backend. To do so, use `<%= %>` to wrap the ruby call. To get the url of a page get the prefix from running `rake routes` and use `<a href="<%= prefix_path %>">my_link_to_prefix</a>`. For example for the profile page you use `profile_path` since the prefix for the profile page from `rake routes` is "profile".

For css and javascript, go to `app/assets/javascripts` or `app/assets/stylesheets` and place your scripts there. They will automatically compile into the application. Write as many or as few files as you want.

## Testing
Simple run `rails s` from the project directory and visit localhost:3000
