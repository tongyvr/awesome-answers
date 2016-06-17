class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @question = Question.new
  end

  def create
    @question       = Question.new question_params
    @question.user = current_user
    # question = Question.new title: params[:question][:title],
    #                         body: params[:question][:body]
    if @question.save
      redirect_to questions_path(@question), notice: "Question created!"
    else
      flash[:alert] = "Question not created!"

      render :new
    end
  end

  def show
    @question.increment!(:view_count)
    @answer = Answer.new

  end

  def index
    @questions = Question.order(created_at: :desc)
  end

  def edit
  end

  def update
    question_params
    if @question.update question_params
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "Question deleted"
  end

  private

  def authenticate_user!
    redirect_to new_session_path, alert: "Please sign in" unless user_signed_in?
  end

  def question_params
    params.require(:question).permit(:title, :body, :category_id)
  end

  def find_question
    @question = Question.find params[:id]
  end


end
