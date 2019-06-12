module TestsHelper

  def current_year
    Date.today.strftime("%Y")
  end

  def test_title
    Test.find(@test.id).title
  end

  def github_url
    title = 'Учебный проект в онлайн-школе Thinknetica'
    link = 'http://thinknetica.com/'
    link_to title, link, target: :_blank
  end

  def question_header
    if params[:action] == 'edit'
      "Редактирование вопроса (#{test_title})"
    else
      "Новый вопрос (для #{test_title}):"
    end
  end

end
