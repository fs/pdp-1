class ArticleDecorator < ApplicationDecorator
  delegate :title

  def author_full_name
    user.full_name_with_email
  end

  def short_text
    h.truncate(object.text)
  end

  def time_created_in_words
    h.time_ago_in_words(object.created_at)
  end

  private

  def user
    @user ||= object.user.decorate
  end
end
