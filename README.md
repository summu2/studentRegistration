# README

Student Registration backend on Ruby on rails
Created 4 apis for the student registration system

Table schema-
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false

API'S
1. get_all_students (GET) - 
    i) get all registered students and order by updated_at desc -> Student.all.order(updated_at: :desc)
    ii) This api also sorts the table on the basis of 4 columns , params -> params[:sort] ,  params[:direction] -> Student.all.order(params[:sort] + " " +   
      params[:direction])

2. get_student_by_id(GET)       
   gets a particular student by their id.

3. create_or_update_student(POST)
    Its an upsert (update + insert)
    used for creating a student as well updating the student.

4. delete_student
   mark the student as deleted, I am only soft deleting the student and not hard deleting from the table.
   kept an column 'is_deleted' boolean column for the same whose default value is false while migrating the schema/while creating the record.
   
   
   
url for backend ->  https://students-registration123.herokuapp.com/  
I havent handled the default landing page for this as this only serves as backend
   
 
