class Post < ApplicationRecord
  acts_as_readable on: :created_at
end
