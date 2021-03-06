class VotesController < ApplicationController
  def create
    if !session[:user_id]
      flash[:warning] = "A problem occurred: You must log in to do that"
    else
      @vote = Vote.new(work_id: params[:id], user_id: session[:user_id])
      if @vote.save
        flash[:success] = "Successfully upvoted!"

      else
        flash[:warning] = "A problem occurred: Could not upvote"
        flash[:validation_errors] = @vote.errors.full_messages
      end
    end
    redirect_back fallback_location: root_path
  end
end
