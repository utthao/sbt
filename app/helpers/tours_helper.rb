module ToursHelper
  def view_rate(tour)
    @rates = Rate.where(tour_id: tour.id)
    @rates.size
  end

  def image_home tour
    tour.images.first.path
  end

  def edit_status
    [{id: "unvisible", name: t("unvisible")},
     {id: "visible", name: t("visible")}]
  end
end
