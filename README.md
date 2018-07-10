# Jungle

An e-commerce application built with Ruby, Rails, ActiveRecord, and RSpec.

#### Product Details Page

!["Product Details"](/docs/product-details.png)

#### Home Page
!["Home Page"](/docs/home-page.png)

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

### Web Application Setup

1. Install dependencies (`bundle install`)
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run the development web server (`bin/rails s -b 0.0.0.0`)
9. Go to http://localhost:3000/ in your browser

#### Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing [Stripe Docs](https://stripe.com/docs/testing#cards)