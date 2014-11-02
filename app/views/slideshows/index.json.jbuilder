json.array!(@slideshows) do |slideshow|
  json.extract! slideshow, :id, :background, :transition, :slotamount, :masterspeed, :delay
  json.url slideshow_url(slideshow, format: :json)
end
