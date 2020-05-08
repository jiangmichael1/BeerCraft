# CHANGELOG

## 0.4.1

- Renamed the items? methods to `items?` and `no_items?`

## 0.4.0

- Updated dependencies to use it on Rails 5

### Breaking changes

- Remove the `empty?` method and add `has_items?` and `has_no_items?`.
- Updated money-rails dependency to at least 1.5 which can potentially break your app.
