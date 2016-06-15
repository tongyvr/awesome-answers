class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    # question = Question.new title: params[:question][:title],
    #                         body: params[:question][:body]
    if @question.save
      redirect_to questions_path(@question), notice: "Question created!"
      # render json: params
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

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def find_question
    @question = Question.find params[:id]
  end


end
