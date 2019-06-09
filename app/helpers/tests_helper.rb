module TestsHelper

  def current_year
    Date.today.strftime("%Y")
  end

  def test_title
    Test.find(params[:test_id]).title
  end

  def github_url
    title = 'Учебный проект в онлайн-школе Thinknetica'
    link = 'http://thinknetica.com/'
    link_to title, link, target: :_blank
  end

end
