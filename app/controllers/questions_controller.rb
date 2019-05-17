class QuestionsController < ApplicationController

  def index
    @result = Question.all_by_test_id(params[:test_id].to_i).pluck(:body)
    render inline: 'Вопросы теста: <%= @result.join(" ") %>'
  end

  def show
    @result = Question.all_by_test_id(params[:test_id].to_i).pluck(:body)
    render inline: '<%= @result[params[:id].to_i - 1] %>'
  end

  def create
    body = params[:question][:body]
    test_id = params[:test_id].to_i
    Question.create(body: body, test_id: test_id)
    render plain: 'Вопрос создан'
  end

  def delete
    render plain: 'Deeeeeelete'
  end

  def new

  end

end
