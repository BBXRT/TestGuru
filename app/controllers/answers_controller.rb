class AnswersController < ApplicationController
  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
    @answer = Answer.find(params[:id])
    pp @answer

    @question = Question.find(params[:id])
    @test = @question.test
  end

  def create
    pp params
    body = params[:answer][:body]
    correct = params[:answer][:correct]
    @question = Question.find(params[:question_id])
    Answer.create(body: body, correct: correct, question_id: @question.id)
    redirect_to question_path(@question)
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.body = params['answer']['body']
    @answer.correct = params['answer']['correct']
    @answer.save
    redirect_to @answer.question
  end

  def destroy
    @answer.destroy
    redirect_to @answer.question
  end

  private

    def find_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct)
    end
end
