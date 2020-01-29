module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "base.title"
    page_title.blank? ? base_title : (page_title << "|" << base_title)
  end

  def tour_can_book?
    (@tour.start_day.to_i > Time.now.to_i)
  end

  def tour_row_can_book?
    (tour_row.start_day.to_i > Time.now.to_i)
  end
end
