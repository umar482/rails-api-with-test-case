class Mappings::VehicleModel
  MAPPING = {
    "Audi": 1
    "BMW": 2
    "Buick": 3
    "Cadillac":4
    "Chevrolet":5
    "Chrysler":6
    "Dodge":7
    "Fiat":8
    "Ford":9
    "Duty": 10
  }.freeze

  def self.types
    MAPPING.keys.map(&:to_s)
  end
end
