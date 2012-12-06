# Tubular

Tubular helps you quickly and easily generate HTML tables.

## Installation

Add this line to your application's Gemfile:

    gem 'tubular'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tubular

## Usage

Tubular was designed with collections in mind.

Given a model like the following:

```ruby
  class User < ActiveRecord::Base
    attr_accesible :first_name, :last_name, :email
  end
```

And a collection populated with instances of the given model:

```ruby
  @users = [
    User.new(:first_name => "John",    :last_name => "Wayne",    :email => "john@wayne.com"),
    User.new(:first_name => "Air",     :last_name => "Jordan",   :email => "air@jordan.com"),
    User.new(:first_name => "Charles", :last_name => "Bukowski", :email => "c@bukowski.com")
  ]
```

One can easily generate an HTML table in the following manner:

```erb
  <%= table_for(@users) do %>
    <% column :first_name %>
    <% column :last_name %>
    <% column :email %>
  <% end %>
```

This ERB template would generate the following HTML:

```html
  <table>
    <thead>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
      <tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Wayne</td>
        <td>john@wayne.com</td>
      </tr>
      <tr>
        <td>Air</td>
        <td>Jordan</td>
        <td>air@jordan.com</td>
      </tr>
      <tr>
        <td>Charles</td>
        <td>Bukowski</td>
        <td>c@bukowski.com</td>
      </tr>
    </tbody>
  </table>
```

# API

In order to customize the output of the generated HTML, one can pass the following
options:

```erb
  <%= table_for(@users, :table_html => { :class => "index_table" }) do %>
    <% column :first_name, :header_html    => { :class => "sortable" } %> 
    <% column :last_name,  :cell_html      => { :class => "featured" } %> 
    <% column :email,      :header_content => proc { "Email #{1 + 1}" } %>
    <% column :full_name,  :header_content => "Full Name", :cell_content => proc {|user| "#{ user.first_name } #{ user.last_name }" } %>
    <% column :actions,    :header_content => "",          :cell_content => "Some action." %>
  <% end %>
```
This ERB template would generate the following HTML:

```html
  <table class="index_table">
    <thead>
      <tr>
        <th class="sortable">First Name</th>
        <th>Last Name</th>
        <th>Email 2</th>
        <th>Full Name</th>
        <th></th>
      <tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td class="featured">Wayne</td>
        <td>john@wayne.com</td>
        <td>John Wayne</td>
        <td>Some action.</td>
      </tr>
      <tr>
        <td>Air</td>
        <td class="featured">Jordan</td>
        <td>air@jordan.com</td>
        <td>Air Jordan</td>
        <td>Some action.</td>
      </tr>
      <tr>
        <td>Charles</td>
        <td class="featured">Bukowski</td>
        <td>c@bukowski.com</td>
        <td>Charles Bukowski</td>
        <td>Some action.</td>
      </tr>
    </tbody>
  </table>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
