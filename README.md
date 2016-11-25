# NoteEx

## Installation

1. Install ruby 2.3.1
2. Check if you have bundler by typing "bundle" in your command line. If no, run `gem install bundler`
3. Clone this project to your computer
4. cd into the project directory and run `bundle install`
5. Run `bundle exec rake db:setup`. Subsequent times you can run `bundle exec rake db:migrate` since you don't need to create or seed the database again.
6. test it's working by running `rails s` on going to your browser and visiting localhost:3000

## Development

For simplicity I put all the views under one directory. To find your html document, go to app/views/basic/

The routes can be seen by running `bundle exec rake routes` from the project directory. Take note of the prefix column.

your html documents can dynamically get info from the backend. To do so, use `<%= %>` to wrap the ruby call. To get the url of a page get the prefix from running `rake routes` and use `<a href="<%= prefix_path %>">my_link_to_prefix</a>`. For example for the profile page you use `profile_path` since the prefix for the profile page from `rake routes` is "profile".

For css and javascript, go to `app/assets/javascripts` or `app/assets/stylesheets` and place your scripts there. They will automatically compile into the application. Write as many or as few files as you want.

### user authentication

TO DISABLE: Comment out the line at the top of `app/controllers/basic_controller` that requires user presence.

for sign up post a form to `register_path` with params `username`, `password`, `password_confirmation`.
for login post a form to `authenticate_path` with params `username`, and `password`

If a user is not signed in, API calls will return `{ error: 'Authentication Error', msg: 'User not signed in' }`. For page requests it will redirect to login.
On signup if you fail to register, `@user` will be made available to you in your view. You should check `if @user && @user.errors.any?` before using @user or you may error.
You can then use
```html
<% if @user && @user.errors.any? %>
  <ul class="error-list">
    <% @user.errors.full_messages.each do |error_message| %>
      <li><%= error_message %></li>
    <% end %>
  </ul>
<% end %>
```
This will check if there is a user already attempting to be made, and if there are any errors. If so then for each error message loop, and print li with the error message
If you're really ambitious, you can prefill the form with what the user already tried to enter by accessing the attributes of `@user`.

### file downloading

use the `api_notes_download_path` and a GET request with the param `?id=12` where 12 is the actual id of the note. This will return a url `{ data: { url: 'blabla' } }` that you must redirect the browser to just like clicking a link. This will instead download the file.

### API

API uses standardized response
on error you receive `{ error: 'ErrorType', msg: 'Descriptive message of the error', status: 400 }`
on success you receive `{ data: some_data, status: 200 }`. If there is no need to return data you'll just get the status field.
The status is also in the headers.

Here is a use case of the APIs
`POST /api/notes/upload`, I'm expecting an attachment field which corresponds to the field user[avatar] in the tutorial below. I'm also expecting a `teaching_id` field to know which teaching the notes belong to. See how to upload files with ajax below
https://quickleft.com/blog/how-to-upload-to-carrierwave-with-javascript/

`GET /api/notes/download` expecting an "id" field of the note you want to download. This returns a URL you can redirect to.

`GET /api/courses/search` expecting a "query" field with the search query

`GET /api/courses/teachings` expecting a "id" field for the course. This returns the teachings of a course along with their prof, and term.

`GET /api/courses/show` expecting an "id" field for the course. This returns the course along with it's school

`GET /api/teachings/notes` expecting an "id" field for the teaching id that you wish to get a list of notes to

## Testing
Simple run `rails s` from the project directory and visit localhost:3000
