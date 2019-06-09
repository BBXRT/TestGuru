class QuestionsController < ApplicationController

  before_action :select_test_id, only: [:create]

  def index
    @test = Test.find(params[:test_id])
    @questions = @test.questions
  end

  def show
    begin
      @question = Question.find(params[:id].to_i)
    rescue ActiveRecord::RecordNotFound => e
      render plain: "Вопрос не найден! (#{e})"
    end
  end

  def create
    body = params[:question][:body]
    Question.create(body: body, test_id: @test.id)
    redirect_to test_questions_path
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to test_questions
  end

  def new
    @test = Test.new
    redirect_to index
  end

  def select_test_id
    @test = Test.find(params[:test_id])
  end

  def edit
    #render plain: '23'
  end

end
