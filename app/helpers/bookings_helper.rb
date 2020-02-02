module BookingsHelper

  def edit_booking_status
    [{id: "uncheck", name: t("uncheck")},
     {id: "accepted", name: t("accept")},
     {id: "denied", name: t("deny")}]
  end

end
