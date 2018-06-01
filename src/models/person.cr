class Person < Granite::ORM::Base
  adapter pg
  table_name people


  # id : Int64 primary key is created for you
  field name : String
  field thumb : String
  field flair : String
  timestamps
end
