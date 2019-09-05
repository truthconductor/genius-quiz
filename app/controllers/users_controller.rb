class UsersController < ApplicationController
  def show
    @quizzes = Quiz.includes([:user, :questions]).where(user_id: params[:id]).order(updated_at: :desc)
  end
end
