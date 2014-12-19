require_relative 'objects_filter'

class DinosaurInfo
  attr_accessor :dinosaurs, :dinosaurs_filtered, :filters_applied
  TO_S_LINE = "\n----------------------\n"

  def initialize(new_dinosaurs)
    self.dinosaurs = new_dinosaurs
  end

  # filters should be in the following format
  # { operator <string> => { attribute: value } }
  def filter_dinosaurs(filters = {})
    self.dinosaurs_filtered = ObjectsFilter.filter_objects(filters, dinosaurs)
    self.filters_applied = filters
  end

  def to_s(include_filter = false)
    dinos = include_filter ? dinosaurs_filtered : dinosaurs
    output = title(include_filter) + TO_S_LINE
    output << formatted_dinosaurs(dinos)
  end

  def to_json(include_filter = false)
    if include_filter
      dinosaurs_filtered.to_json
    else
      dinosaurs.to_json
    end
  end

  private

  def title(include_filter = false)
    if include_filter
      "DinoDex current Dinosaur Info Last Filter (#{filters_applied}):"
    else
      "DinoDex current Dinosaur Info:"
    end
  end

  def formatted_dinosaurs(dinos)
    dinos.map { |dino| dino.to_s }.join(TO_S_LINE)
  end
end
