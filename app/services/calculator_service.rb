class CalculatorService
  # TODO: Arrumar
  def self.calculate_discount(promotion)
    return nil if promotion.price_from == 0
    return 100 * promotion.price_to / promotion.price_from
  end
end
