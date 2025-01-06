## Project Description

Welcome to the Blog Project! This application allows users to log in, log out, create articles, publish them, and interact with others by liking and commenting on articles.

## Features:

- User authentication with Devise
- Article management
- Likes on articles
- Commenting system
- Tailwind CSS for styling
- Bootstrap integration
- Pagination with Kaminari
- Image uploading and cropping
- Lazy loading of images for better performance

## Prerequisites

Before you begin, ensure you have the following installed:

- Ruby 3.0.0
- Rails 7.1.5
- PostgreSQL
- git
- node
- yarn

## Cloning the Repository

To set up the project locally, follow these steps:

### 1. Clone the repository:

   git clone https://github.com/yourusername/blog-project.git
   cd blog-project

### 2. Install dependencies:

   Make sure you have Bundler installed. If not, you can install it via:

 -  gem install bundler

   Then install the required gems:

 -  bundle install

## Setting Up the Database

### 1. Create the database:

   After cloning the repository and installing dependencies, set up the PostgreSQL database:

 -  rails db:create
   
### 2. Run migrations:

   Apply the database migrations:

 -  rails db:migrate 

## Dependencies

The project uses the following dependencies:

- Ruby on Rails: Version 7.1.5
- PostgreSQL: For the database (~> 1.1)
- Tailwindcss-rails: For styling
- Bootstrap: For responsive components(~> 5.1.3)
- Devise: For user authentication
- Pundit: Authorization for user roles (~> 2.4)
- Kaminari: Pagination
- Turbo-rails: Real-time updates for comments and likes.
- Cropper Rails: For image cropping (~> 1.1, >= 1.1.6)
- Image Processing: To handle image uploads (~> 1.2)
- MiniMagick: For image processing
- Stimulus: JavaScript framework integration with Rails for enhancing interactivity

## Running the Application

After setting up the database and installing dependencies, you can start the Rails server:

rails bin/dev

Visit (http://localhost:3000) in your web browser to access the application.

### Thank you for checking out the Blog Project! 
