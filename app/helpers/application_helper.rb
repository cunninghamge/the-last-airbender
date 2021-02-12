module ApplicationHelper
  def element_nation
    [
      ['Air Nomads', 'air_nomads'],
      ['Earth Kingdom', 'earth_kingdom'],
      ['Fire Nation', 'fire_nation'],
      ['Water Tribes', 'water_tribes'],
    ]
  end

  def display_collection(collection)
    if collection.blank?
      'None'
    else
      collection.join(', ').rstrip
    end
  end
end
