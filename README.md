# lab-08

**Edit and update existing records + display associated data**

In this lab, you will add functionality to edit existing records through forms and display related data between your models.

---

## Instructions

### 1. Add `edit` and `update` actions

For each of the following models, implement the `edit` and `update` actions in the controller and views:

- `User`
- `Chat`
- `Message`

Each `edit` view should include a form that allows updating all the editable attributes of the record.

> 💡 Use `form_with model:` to reuse the same form structure as in the `new` views.

---

### 2. Display associated records in the `show` views

Update the `show` views for each model to include information from their related models:

- `User#show`: Show a list of all chats the user participates in and messages they have sent.
- `Chat#show`: Display the sender and receiver names, and list all messages in the chat.
- `Message#show`: Show the associated user and chat.

Use embedded Ruby and basic HTML lists or tables.

---

### 3. Add validations to update forms

Ensure that validation errors are shown when updating records. For example:

- If a user tries to save an email that is already taken
- If a message is submitted with an empty body

Use `model.errors.full_messages` to display errors near the form.

---

### 4. Add links for editing

In each index and show view, add links to edit the record:

- Example: In `users/show.html.erb`, include a link to "Edit user".
- Example: In `messages/index.html.erb`, include a link next to each message to "Edit message".

Use `link_to` helpers with `edit_*_path`.

---

### 5. (Bonus) Display message counts

As a bonus, display the number of messages sent by each user in `users/index.html.erb`.

> 💡 Use Active Record associations and the `.count` method to achieve this.

---

Test your implementation using both the Rails console and the browser. Make sure all forms and links work correctly and validations behave as expected.
