class Post < Granite::ORM::Base
  adapter pg
  table_name posts

  belongs_to :user

  # id : Int64 primary key is created for you
  field title : String
  field content : String
  field link : String
  field likes : Int32
  field thumb : String
  timestamps
end
