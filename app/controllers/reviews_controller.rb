class ReviewsController < ApplicationController

#
  def create
    review = find_by_user(params[:user])


    review = Review.new

    @review.user = current_user




    private

    def review_params
      params.require(:review).permit
        :rating
        :description

    end
  end
#

end
