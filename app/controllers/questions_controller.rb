class QuestionsController < ApplicationController

  def index
    # @result = Question.all_by_test_id(params[:test_id].to_i).pluck(:body)
    # render inline: 'Вопросы теста: <%= @result.join(" ") %>'
  end

  def show
    @result = Question.all_by_test_id(params[:test_id].to_i).pluck(:body)
    render inline: '<%= params %>'
  end

  def create
    body = params[:question][:body]
    test_id = params[:test_id].to_i
    Question.create(body: body, test_id: test_id)
    render plain: 'Вопрос создан'
  end

  def destroy
    #render inline: '<%= params %>'
    render plain: 'deeeeleeeeeteeeed'
    # @question = Question.find(params[:id])
    # @question.destroy
  end

  def new

  end

end
