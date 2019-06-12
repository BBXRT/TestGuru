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
    @test = Test.find(params[:test_id])
    Question.create(body: body, test_id: @test.id)

    redirect_to test_questions_path(@test)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  def new
    @test = Test.find(params[:test_id])
    @question = Question.new(test: @test)
  end

  def select_test_id
    @test = Test.find(params[:test_id])
  end

  def edit
    @question = Question.find(params[:id])
    @test = @question.test
  end

  def update
    @question = Question.find(params[:id])
    @question.body = params['question']['body']

    @question.save
    redirect_to test_questions_path(@question.test)
  end

end
