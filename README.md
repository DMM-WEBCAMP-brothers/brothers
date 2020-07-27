# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
<header class="-">
      <div class="container">
       <nav class="nav navbar-nav navbar-left">
        <span class="header-title">LOGO</span>
       </nav>

       <nav>
         <ul class="nav navbar-nav navbar-right">

          <% if user_signed_in? %>

           <li><%= link_to " Home", user_path(current_user.id), class: "glyphicon glyphicon-home home" %></li>
           <li><%= link_to " Users", users_path, class: "glyphicon glyphicon-link about" %></li>
           <li><%= link_to " Books", books_path, class: "glyphicon glyphicon-edit sign_up" %></li>
           <li><%= link_to " logout", destroy_user_session_path, method: :delete, class: "glyphicon glyphicon-log-in sign_in" %></li>

          <% elsif admin_signed_in? %>
           <li>管理者</li>
           <li><%= link_to "ログアウト", destroy_admin_session_path, method: :delete %></li>

          <% else %>

           <li><%= link_to " Home", root_path, class: "glyphicon glyphicon-home home" %></li>
           <li><%= link_to " About", about_path, class: "glyphicon glyphicon-link about" %></li>
           <li><%= link_to " sign up", new_user_registration_path, class: "glyphicon glyphicon-edit sign_up" %></li>
          <li><%= link_to " login", new_user_session_path, class: "glyphicon glyphicon-log-in sign_in" %></li>
          <% end %>

        </ul>








      </div>
    </header>




<%= f.select  :production_status, Order_product.production_statuses_i18n.keys.map {|k| [Order_product.production_statuses_i18n[k], k]} %>
<%= f.select  :status, Order.statuses_i18n.keys.map {|k| [Order.statuses_i18n[k], k]} %>