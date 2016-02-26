require_relative "./_configure"

DB.define_table("users")
DB.define_column("users", "name", "string")
DB.define_column("users", "email", "string")
DB.define_column("users", "password", "string")

DB.define_table("todos")
DB.define_column("todos", "title", "string")
DB.define_column("todos", "description", "text")
DB.define_column("todos", "completed", "boolean")
DB.define_column("todos", "user_id", "integer")
DB.define_column("todos", "assigned_to_id", "integer")
DB.define_column("todos", "category_id", "integer")

DB.define_table("categories")
DB.define_column("categories", "name", "string") 

DB.define_table("assignments")
DB.define_column("assignments", "todo_id", "integer")
DB.define_column("assignments", "user_id", "integer")