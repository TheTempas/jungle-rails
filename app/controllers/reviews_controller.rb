class ReviewsController < ApplicationController

  def create

    @product = Product.find(params[:product_id])
    # Retrieve product from database.

    @review = @product.reviews.new(rating: params[:review][:rating], description: params[:review][:description], user: current_user)
    # Creating review for that product and storing it in 'review'

    # review.user = current_user
    # Assign review to user before saving

    @reviews = Review.where(["product_id = ?", @product.id])

    puts @review.inspect
    puts params.inspect

    if @review.save
      puts "Review saved"
      redirect_to "/products/#{@product.id}", notice: "Review created"
    else
      puts "Review not saved"
      puts @review.errors.full_messages
      render 'products/show'
    end

  end

    # private

    #   def review_params
    #   params.require(:review).permit
    #     :rating
    #     :description
    #   end

end