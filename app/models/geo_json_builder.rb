class GeoJsonBuilder
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def build
    @items.map do |item|
      jsonify(item)
    end.to_json
  end

  def jsonify(item)
    {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [item.longitude, item.latitude]
      },
      properties: {
        title: item.name,
        "marker-size" => "small",
        "marker-color" => "000000",
        "marker-symbol" => "circle"
      }
    }
  end
end
