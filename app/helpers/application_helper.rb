# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title)
    base_title = I18n.t 'base.title'
    page_title.blank? ? base_title : (page_title << '|' << base_title)
  end

  def tour_can_book?
    (@tour.start_day.to_i > Time.now.to_i)
  end

  def tour_row_can_book?
    (tour_row.start_day.to_i > Time.now.to_i)
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
