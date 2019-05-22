class QuestionsController < ApplicationController

  before_action :select_test_id

  def index
  end

  def show
    begin
      @result = Question.find(params[:id].to_i)
      render inline: '<%= @result.body %>'
    rescue
      render plain: 'Вопрос не найден'
    end

  end

  def create
    body = params[:question][:body]
    Question.create(body: body, test_id: @test_id)
    render plain: 'Вопрос создан'
  end

  def destroy
    render plain: 'Вопрос удалён!'
    @question = Question.find(params[:id])
    @question.destroy
  end

  def new
  end

  def select_test_id
    @test_id = params[:test_id].to_i
  end

end
