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
# lab-10

**Create a personalized inbox for each user**

In this lab, you will customize your application so that each signed-in user sees only the chats they participate in. You will also enforce access control using CanCanCan and extract logic using model scopes.

---

## Instructions

### 1. Show only relevant chats for the signed-in user

When a user visits `/chats`, they should only see the chats where they are either the sender or the receiver.

To implement this, you must define un **scope** en tu modelo `Chat`.

---

#### 💡 What is a scope?

A **scope** is a way to define custom queries that you can reuse throughout your Rails application. Scopes are defined inside a model and help keep your controllers clean and readable.

A basic example:

```ruby
# In app/models/post.rb
class Post < ApplicationRecord
  scope :published, -> { where(published: true) }
end
```

Then, in your controller or view, you can use it like this:

```ruby
@posts = Post.published
```

This is equivalent to `Post.where(published: true)`, but much easier to reuse and understand.

---

For this lab, define a scope in your `Chat` model that allows you to retrieve all chats where a given user is either the sender or the receiver. Use that scope in your controller to populate the inbox.

---

### 2. Restrict access to chats using CanCanCan

Users should **only be able to view chats in which they are participants**. You must define this rule using **CanCanCan**.

Update your `Ability` class to give users permission to `:read` only the chats where they are involved.

Use CanCanCan's `load_and_authorize_resource` or a similar mechanism in your controller to apply this rule.

> ⚠️ Do not manually check the current user in the controller. The authorization must be handled by CanCanCan.

---

### 3. Add a link to "My Inbox"

In your main navigation (layout), add a link labeled **"My Inbox"** that leads to the chat list.

Only show this link if a user is signed in.

---

### 4. Show the other participant's name

In the chat list (`chats#index`), for each chat, display the name of the **other user** in the conversation.

You’ll need to define a method in the `Chat` model that, given the current user, returns the other participant.

Use that method in the view to display their full name.

---

### 5. Bonus (optional): Hide or restrict `/users`

As a bonus, you can hide the full user list from regular users. You may choose to show it only to admins, or redirect regular users to their inbox or profile.

---

### Testing

To test your implementation, log in with different users and verify that:

- The inbox shows only their chats
- They cannot access chats where they are not participants
- CanCanCan correctly blocks unauthorized access
- The UI clearly shows who the other person in each chat is
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