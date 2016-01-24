class ReviewsController < ApplicationController
  before_action :set_quantity

  def new
    @card = current_user.cards.review.first
  end

  def create
    card = current_user.cards.find(review_params[:card_id])

    if card.check_translation(review_params[:entered_text])
      flash[:true] = "#{t(:true_html)}"\
                     "#{t(:the_right_answer)} #{card.original_text} #{card.transcription}<br>"
    else
      flash[:false] = "#{t(:false_html)}"\
                      "#{t(:the_right_answer)} #{card.original_text} #{card.transcription}<br>"\
                      "#{t(:your_answer)} #{review_params[:entered_text]}"
    end

    redirect_to :back
  end

  private

  def set_quantity
    @quantity = current_user.cards.count    
  end

  def review_params
    params.require(:review).permit(
      :card_id,
      :entered_text
    )
  end
end
