#-Make Models
#  -Mentor
#  -Student
#  -Language
#  -Sub-area
#  -Resource
#  -Languages_mentors
#  -Languages_students

#-Make Controllers
#  -Mentors
#  -Students
#  -Languages
#  -Resources
#  -Sessions

#-Set up signup/authentication
#  -Mentor has_secure_password
#  -Student has_secure_password
#  -Mentor has validations
#  -Student has validations
#  -Mentor can signup via username/password
#  -Student can signup via username/password
#  -Mentor can login with username/password
#  -Student can login with username/password
#  -Mentor can signup login via GitHub
#  -Student can signup login via GitHub

#-Set up login /authentication
#  -Mentor can login via github or username/password
#  -Student can login via username/password

#-Validations for other models

#-Build user homepage
#-BUild user edit profile page

#-Can add languages to profile

#-Build resource show page
#-Build resource edit page
#-Build resource index page

#-Student can mark resource as read
#-Student can rate resource

# -Put green border around profile pictures
#-Can delete languages from profile
#-Style submit buttons
#-Style dropdown menus
#-Style student submit read and rating
#-Refactor profile displays into partial
#-Continue to refactor with partials
#-Render error messages on sign up
#-Organize display of resources by language and then by subfield
#-Make sure validation messages don't repeat
#-Set up authorization

#-Create current_user private method
#-Add before actions - don't call find in controllers
#  - before_action method_name, only: [:show, :edit]
#-Refactor nav into parial

-Refactor with helper methods
-Take logic out of view and controller
-Delete unused routes





#top_resources          GET    /resources/top_resources(.:format)   resources#top_resources
#new_or_delete_language GET    /languages/add_or_delete(.:format)   languages#new_or_destroy
#mentors_login          GET    /mentors/login(.:format)             sessions#mentor_new
#students_login         GET    /students/login(.:format)            sessions#student_new
#mentor_login           POST   /mentor_login(.:format)              sessions#mentor_create
#student_login          POST   /student_login(.:format)             sessions#student_create
#resources              GET    /resources(.:format)                 resources#index
#                       POST   /resources(.:format)                 resources#create
---!! new_resource      GET    /resources/new(.:format)             resources#new
---!! edit_resource     GET    /resources/:id/edit(.:format)        resources#edit
---!! resource          GET    /resources/:id(.:format)             resources#show
---!!                   PATCH  /resources/:id(.:format)             resources#update
---!!                   PUT    /resources/:id(.:format)             resources#update
---!!                   DELETE /resources/:id(.:format)             resources#destroy
---!! languages         GET    /languages(.:format)                 languages#index
#languages              POST   /languages(.:format)                 languages#create
---!! new_language      GET    /languages/new(.:format)             languages#new
---!! edit_language     GET    /languages/:id/edit(.:format)        languages#edit
---!! language          GET    /languages/:id(.:format)             languages#show
---!!                  PATCH  /languages/:id(.:format)              languages#update
---!!                  PUT    /languages/:id(.:format)              languages#update
---!!                  DELETE /languages/:id(.:format)              languages#destroy
#mentor_resources      GET    /mentors/:mentor_id/resources         resources#index
#                      POST   /mentors/:mentor_id/resources         resources#create
#new_mentor_resource   GET    /mentors/:mentor_id/resources/new     resources#new
#edit_mentor_resource  GET    /mentors/:mentor_id/resources/:id/edit resources#edit
#mentor_resource       GET    /mentors/:mentor_id/resources/:id     resources#show
#                      PATCH  /mentors/:mentor_id/resources/:id     resources#update
#                      PUT    /mentors/:mentor_id/resources/:id     resources#update
#                      DELETE /mentors/:mentor_id/resources/:id     resources#destroy
#mentors               GET    /mentors(.:format)                    mentors#index
#                      POST   /mentors(.:format)                    mentors#create
#new_mentor            GET    /mentors/new(.:format)                mentors#new
#edit_mentor           GET    /mentors/:id/edit(.:format)           mentors#edit
#mentor                GET    /mentors/:id(.:format)                mentors#show
#                      PATCH  /mentors/:id(.:format)                mentors#update
#                      PUT    /mentors/:id(.:format)                mentors#update
#                      DELETE /mentors/:id(.:format)                mentors#destroy
#student_resources     GET    /students/:student_id/resources       resources#index
#new_student_resource  GET    /students/:student_id/resources/new   resources#new
#edit_student_resource GET    /students/:student_id/resources/:id/edit resources#edit
#student_resource      GET    /students/:student_id/resources/:id   resources#show
---!!  students              GET    /students(.:format)                   students#index
#                      POST   /students(.:format)                   students#create
#new_student           GET    /students/new(.:format)               students#new
#edit_student          GET    /students/:id/edit(.:format)          students#edit
#student               GET    /students/:id(.:format)               students#show
#                      PATCH  /students/:id(.:format)               students#update
#                      PUT    /students/:id(.:format)               students#update
#                      DELETE /students/:id(.:format)               students#destroy
#root                  GET    /                                     application#index
#auth_github_callback GET    /auth/github/callback(.:format)        sessions#mentor_gh_create
#logout                GET    /logout(.:format)                     sessions#logout
#student_mentor        GET    /student/:id/mentor(.:format)         students#show_mentor
#mentor_student        GET    /mentor/:id/student(.:format)         mentors#show_student
#    add_mentor        POST   /add_mentor(.:format)                 students#add_mentor
#delete_language       POST   /delete_language(.:format)            languages#destroy
#rails_service_blob    GET    /rails/active_storage/blobs/:signed_id/
