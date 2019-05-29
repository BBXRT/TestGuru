class QuestionsController < ApplicationController

  before_action :select_test_id, only: [:create]

  def index
    @test = Test.find(params[:test_id].to_i)
    @questions = @test.questions
  end

  def show
    begin
      @question = Question.find(params[:id].to_i)
      #render inline: '<%= @question.body %>'
    rescue
      render plain: 'Вопрос не найден'
    end
  end

  def create
    body = params[:question][:body]
    Question.create(body: body, test_id: @test.id)
    render inline: 'Вопрос создан <%= button_to "Назад к списку вопросов", test_questions_path, method: :get %>'
  end

  def destroy
    render inline: 'Вопрос удалён! <%= button_to "Назад к списку тестов", tests_path, method: :get %>'
    @question = Question.find(params[:id])
    @question.destroy
  end

  def new
    @test = Test.new
  end

  def select_test_id
    @test = Test.find(params[:test_id].to_i)
  end

end
