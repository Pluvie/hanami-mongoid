# Hanami::Mongoid

This simple gem aims to replicate Hanami concept of _repositories_ when using MongoDB as database.
It adds a class `Hanami::Mongoid::Repository` which is a substitute for the original `Hanami::Repository` class.

## Installation

Use thi line to your application's Gemfile instead of `hanami-model`:

```ruby
gem 'hanami-mongoid'
```

And then execute:

    $ bundle install

## Usage

When generating a new model, i.e. with

    $ hanami generate model book

Simpy delete the `db` folder (since MongoDB doesn't care for migrations) and change the following generated files:

```ruby
# lib/bookshelf/entities/book.rb
class Book < Hanami::Entity
end
```
```ruby
# lib/bookshelf/entities/book.rb
class Book
    include Mongoid::Document
end
```

And:

```ruby
# lib/bookshelf/repositories/book_repository.rb
class BookRepository < Hanami::Repository
end
```
```ruby
# lib/bookshelf/repositories/book_repository.rb
class BookRepository < Hanami::Mongoid::Repository
end
```

This way you can keep separated the repository and entity logic as Hanami suggests.
You can call the usual database related methods using the repository:
```ruby
BookRepository.new.first                        # #<Book:0x00007fd8b6bea578>
BookRepository.new.find('5af4c697699bbdaad')    # #<Book id: 5af4c697699bbdaad>
```
Or even collection specific methods, for example `insert_many` or `aggregate`.

And of course you can add custom queries in the repository:
```ruby
# lib/bookshelf/repositories/book_repository.rb
class BookRepository < Hanami::Mongoid::Repository
    def most_recent_for_author(author, limit = 8)
        self.where(author: author).order_by(created_at: :desc).limit(limit)
    end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Pluvie/hanami-mongoid.
