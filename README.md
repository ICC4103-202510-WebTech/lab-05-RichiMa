
# lab-07  
**Add associations and new record forms**

In this lab, you will define associations between your existing models and create views that allow users to add new records through forms.

---

## Instructions

### 1. Add associations to your models

Update your models to define the following relationships:

- A `User` can send many `Messages`  
- A `User` can receive many `Messages` through `Chats`  
- A `Chat` has many `Messages`  
- A `Message` belongs to a `Chat`  
- A `Message` belongs to a `User`  
- A `Chat` belongs to a sender (`User`) and a receiver (`User`)

Use the correct `has_many`, `belongs_to` and, when necessary, the `class_name` and `foreign_key` options in your models.

> 💡 Make sure to validate that all associations are working properly using the Rails console.

---

### 2. Add validations

Update your models to include the following validations:

- `User`:
  - `email` must be **present** and **unique**
- `Message`:
  - `body` must be **present**
- `Chat`:
  - `sender_id` and `receiver_id` must be **present**
  - The `sender` and `receiver` must be **different users**

Make sure validation errors are displayed in the form views when a record is not valid.

---

### 3. Create forms to add new records

For each model, create a `new` view and corresponding `create` action in the controller.

You must implement a form for each of the following:

- `User`: A basic form with first name, last name, and email.
- `Chat`: A form where you select a sender and a receiver from existing users.
- `Message`: A form where you select the associated chat, the author (user), and enter the message body.

Use `form_with` and select dropdowns (`f.select`) where necessary.

> 💡 Example: In `app/views/messages/new.html.erb`, the form should let you choose a chat, a user, and write the message body.

---

### 4. Add navigation links

Add links in your index and show views to navigate to the `new` forms for each model. For example, from `users/index.html.erb`, include a link to "Add new user".

---

You are encouraged to test your forms, validations, and associations using both the browser and the Rails console.