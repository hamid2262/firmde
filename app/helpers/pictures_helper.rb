module PicturesHelper
  
  def img_absolute_url obj: obj, type: :tumb
    URI.join(request.url, obj.img.url(type)).to_s
  end

end
