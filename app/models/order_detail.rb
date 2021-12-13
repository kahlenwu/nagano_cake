class OrderDetail < ApplicationRecord
  after_update: check_making_status

  belongs_to :order
  belongs_to :product

  enum making_status: {
    not_startable: 0,
    wating_for_make: 1,
    making: 2,
    completed: 3
  }

  def check_making_status
    if self.making_status == "making"
      self.order.update(status: "making")
    elsif self.making_status == "completed"
      if self.order.order_details.all? { |order_detail| order_detail.making_status == "completed" }
        self.order.update(status: "ready_to_ship")
      end
    end
  end
end
