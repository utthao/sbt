module ToursHelper
  def view_rate(tour)
    @rates = Rate.where(tour_id: tour.id)
    @rates.size
  end
end
