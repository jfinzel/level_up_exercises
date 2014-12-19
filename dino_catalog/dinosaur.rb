require 'active_support/all'

class Dinosaur
  attr_accessor :name, :period, :continent, :diet, :walking, :description, :weight
  CARNIVORES = %w(Carnivore Insectivore Piscivore)
  PERIOD_TYPE_MAPPING = {
    "Early Cretaceous" => "Cretaceous",
    "Late Cretaceous" => "Cretaceous",
    "Cretaceous" => "Cretaceous",
    "Jurassic" => "Jurassic",
    "Oxfordian" => "Oxfordian",
  }

  def initialize(attributes = {})
    self.name = attributes[:name] || nil
    self.period = attributes[:period] || nil
    self.continent = attributes[:continent] || nil
    self.diet = attributes[:diet] || nil
    self.walking = attributes[:walking] || nil
    self.description = attributes[:description] || nil
    self.weight = attributes[:weight] || 0
  end

  def weight=(new_weight)
    @weight = new_weight.to_i
  end

  def carnivore?
    CARNIVORES.include?(diet)
  end

  def period_type
    PERIOD_TYPE_MAPPING[period]
  end

  def to_s
    instance_variables.map { |name| map_variables(name) }.join("")
  end

  private

  def map_variables(name)
    value = instance_variable_get(name)
    format_variable = name.to_s.sub("@", "").titleize
    return "" unless printable?(value)
    "#{format_variable}: #{value}\n"
  end

  def printable?(value)
    !(value.nil? || value == 0 || value == "")
  end
end
