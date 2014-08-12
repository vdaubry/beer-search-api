class Bar
  attr_accessor :id, :name, :city, :street, :street_number, :beers, :longitude, :latitude, :rating

  def initialize(h)
    h.keys.each {|k| send("#{k}=", h[k])}
  end
end