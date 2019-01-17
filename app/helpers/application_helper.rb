module ApplicationHelper
  # tra ve title mac  dinh
  def full_title page_title
    base_title = I18n.t("helper_application.base_title")
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
