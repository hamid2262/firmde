module ApplicationHelper
  def flash_creator flash
    message= "";
    flash.each do |name, msg|   
      case name
        when :notice    
          message += "<div class=\"alert alert-success\">#{msg}</div>"  
        when :warning    
          message += "<div class=\"alert alert-warning\">#{msg}</div>"  
        when :error, :alert
          message += "<div class=\"alert alert-danger\">#{msg}</div>"
        else
          message += "<div class=\"alert alert-info\">#{msg}</div>"     
      end
    end 
    message.html_safe
  end

  def slide_show_visible?
    params[:controller]=="home" and params[:action]== "index" ? true : false
  end

  def layout_selector
    case "#{params[:controller]}##{params[:action]}"
    when "pages#show"
      "pages_layout"
    else
      "homepage_layout"
    end
  end
end
