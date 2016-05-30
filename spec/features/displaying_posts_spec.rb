require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created job information' do
    job_one = create(:post, caption: "This is post one")
    job_two = create(:post, caption: "This is the second post")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='coffee']")
  end

  require 'spec_helper'

  feature 'Can view individual posts' do
    scenario 'Can click and view a single post' do
      post = create(:post)

      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      expect(page.current_path).to eq(post_path(post))
    end
  end

end
