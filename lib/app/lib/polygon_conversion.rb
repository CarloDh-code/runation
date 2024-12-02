module PolygonConversion
  require 'rgeo'
  require 'rgeo/geo_json'

  def polyline_to_polygon(polyline_decoded)
    factory = RGeo::Geos.factory
    points = polyline_decoded.map { |lat, lon| factory.point(lat, lon) }
    polygon = factory.polygon(factory.linear_ring(points))
    if polygon.valid?
      polygon
    else
      polygon = polygon.make_valid
    end
  end
end
