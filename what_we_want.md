What We Want

Show

Input - Rails ERB

<p>
  <b>Name:</b>
  <%= @review.name %>
</p>

<p>
  <b>Year:</b>
  <%= @review.year %>
</p>

<p>
  <b>Review:</b>
  <%= @review.review %>
</p>


<%= link_to 'Edit', edit_review_path(@review) %> |
<%= link_to 'Back', reviews_path %>


Output - ECO

<p>
  <b>Name:</b>
  <%= name %>
</p>

<p>
  <b>Year:</b>
  <%= year %>
</p>

<p>
  <b>Review:</b>
  <%= review %>
</p>

<%= link_to 'Edit', edit_review_path(@review) %> |
<%= link_to 'Back', reviews_path %>

<a href="<%= reviews_path %>">Back</a>



Editing

Input - Rails ERB

<h1>Editing review</h1>

<%= form_for(@review) do |f| %>
  <div class="field">
    <%= f.label :name %><br />
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :year %><br />
    <%= f.number_field :year %>
  </div>
  <div class="field">
    <%= f.label :review %><br />
    <%= f.text_field :review %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>

<%= link_to 'Show', @review %> |
<%= link_to 'Back', reviews_path %>



<h1>Edit review</h1>

<form id="edit-review" name="review">
  <div class="field">
    <label for="name">Name</label>
    <input type="text" name="name" id="name" value="<%= name %>" >
  </div>

  <div class="field">
    <label for="year">Year</label>
    <input type="text" name="year" id="year" value="<%= year %>" >
  </div>

  <div class="field">
    <label for="review">Review</label>
    <input type="text" name="review" id="review" value="<%= review %>" >
  </div>

  <div class="actions">
    <input type="submit" value="Update Review" />
  </div>

</form>

<a href="<%= review_path %>">Show</a>
<a href="<%= reviews_path %>">Back</a>


