module ApplicationHelper

  def format_date(date)
    date.strftime("%B %d, %Y")
  end

  def user_full_name(model_name)
    "#{model_name.user.first_name.titleize} #{model_name.user.last_name.titleize} " if model_name.user.present?
  end
end
