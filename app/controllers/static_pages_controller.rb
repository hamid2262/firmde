class StaticPagesController < ApplicationController
  skip_authorization_check
  
  def google_search
    redirect_to "https://www.google.de/search?q=#{params[:q]}+site:http://opc.de" 
    return false
  end

end
