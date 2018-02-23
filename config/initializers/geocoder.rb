module Geocoder
  def self.city(thing)
    Geocoder.search("#{thing.latitude},#{thing.longitude}").first.try(:city) || Geocoder.search("#{thing.latitude},#{thing.longitude}").first.try(:state) || Geocoder.search("#{thing.latitude},#{thing.longitude}").first.try(:country)
  end
end
