class FTWEvent

  # A sample event hash...
  #
  #{ "title": "RubyMotion with Chris Voss"
  #, "date": "2013-05-28"
  #, "long_date": "Tuesday, May 28, 2013"
  #, "link": "http://plancast.com/p/i1v9"
  #, "time": "6:30p"
  #, "location": "Enilon"
  #, "location_url": "http://goo.gl/maps/BrD3h"
  #, "rsvp_url": "http://plancast.com/p/i1v9"
  #},

  attr_accessor :title, :date, :long_date, :link, :time, :location, :location_url, :rsvp_url

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value) if respond_to?("#{key}=")
    end
  end

  # ...or we can set the properties old school objective-c style
  def self.eventFromDictionary(eventDictionary)
    @event = FTWEvent.alloc.init
    @event.title = eventDictionary['title']
    # ...etc
    @event
  end

end