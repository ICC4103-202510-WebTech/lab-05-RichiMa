# lab-09

**Add authentication and authorization**

In this lab, you will add user authentication to your Rails application using the Devise gem, and implement basic authorization using CanCanCan to control which users can perform certain actions.

---

## Instructions

### 1. Add Devise to your application

1. Add the `devise` gem to your Gemfile and install it:

   ```bash
   bundle add devise
   bin/rails generate devise:install
   ```

2. Enable Devise for your existing `User` model:

   ```bash
   bin/rails generate devise User
   ```

   This will update the model and create a migration to add the required authentication fields.

3. Run the migration:

   ```bash
   bin/rails db:migrate
   ```

4. Update your application layout to show links to **Sign in**, **Sign out**, and **Sign up**, depending on whether a user is signed in.

   > 💡 Use `user_signed_in?`, `current_user`, and `destroy_user_session_path` to conditionally show navigation options.

---

### 2. Protect access with authentication

Use `before_action :authenticate_user!` in your controllers to restrict access to authenticated users.

Example:

```ruby
class MessagesController < ApplicationController
  before_action :authenticate_user!
  ...
end
```

> 💡 You can skip authentication for public pages if needed (e.g., a welcome page).

---

### 3. Add CanCanCan for authorization

1. Add the `cancancan` gem to your Gemfile:

   ```bash
   bundle add cancancan
   ```

2. Generate the `Ability` class:

   ```bash
   bin/rails generate cancan:ability
   ```

3. Define basic permissions. For example:

   ```ruby
   class Ability
     include CanCan::Ability

     def initialize(user)
       return unless user.present?

       can :read, :all
       can :create, Message
       can [:update, :destroy], Message, user_id: user.id
     end
   end
   ```

4. In your controllers, use `authorize!` or `load_and_authorize_resource` to enforce permissions.

   > 💡 Example: Only allow users to edit or delete their own messages.

---

### 4. Adjust your views and UI

- Show or hide buttons based on user permissions (e.g., only show "Edit" or "Delete" if the user has access).
- Use the `can?` helper in views:

   ```erb
   <% if can? :edit, @message %>
     <%= link_to "Edit", edit_message_path(@message) %>
   <% end %>
   ```

---

### 5. (Optional Bonus) Customize Devise views

If you want to personalize the login/signup experience:

```bash
bin/rails generate devise:views
```

You can then edit the HTML in `app/views/devise/` to fit your application.

---

## Final Test

Log in with different users and verify that:

- Authentication is required to access protected pages
- Authorization rules are correctly applied (e.g., users cannot edit or delete messages they do not own)
- The UI reflects permissions appropriately
```