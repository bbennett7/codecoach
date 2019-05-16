Specs:
[x] Using Ruby on Rails for the project // done
[x] Include at least one has_many relationship // Mentor has_many resources
[x] Include at least one belongs_to relationship // Resource belongs_to a mentor
[x] Include at least two has_many through relationships // Student has_many resources through mentor, Mentor has_many languages through languages_mentors
[x] Include at least one many-to-many relationship // languages to mentors

[] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -- STUDENT SUBMITTING RESOURCE.READ

[x] Include reasonable validations for simple model objects // Language, mentor, resource, student and subfield all have validations

[] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -- Resources/top_rated, Resource.top_rated

[x] Include signup (how e.g. Devise) // Mentor and student signups
[x] Include login (how e.g. Devise) // Mentor and student logins
[x] Include logout (how e.g. Devise) // Mentor and student logouts
[x] Include third party signup/login (how e.g. Devise/OmniAuth) // Github

[x] Include nested resource show or index (URL e.g. users/2/recipes) // mentor/:id/resources and mentor/:id/resources/:resource_id
[x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) // mentor/:id/resources/new
[] Include form display of validation errors (form URL e.g. /recipes/new) -- SHOULD BE ON ALL FORMS

Confirm:
[] The application is pretty DRY
[] Limited logic in controllers
[] Views use helper methods if appropriate
[] Views use partials if appropriate
