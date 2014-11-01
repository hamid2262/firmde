module ApplicationHelper
  def flash_creator flash
    message= ""
    klass = ""
    flash.each do |name, msg|   
      case name
        when :notice    
          message += flash_creator_tag_maker "success", msg
        when :warning    
          message += flash_creator_tag_maker "warning", msg
        when :error, :alert
          message += flash_creator_tag_maker "danger", msg
        else
          message += flash_creator_tag_maker "info", msg
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

  def con_act?(kont, arr1, act, arr2)
    (arr1.include?(kont) && arr2.include?(act)) ? true : false
  end

  def act?(act, arr)
    (arr.include?(act)) ? true : false
  end

  def cont?(cont, arr)
    (arr.include?(cont)) ? true : false
  end

  private
    def flash_creator_tag_maker klass, message
      "<div class=\"alert alert-#{klass}\"><button type=\"button\" class=\"pull-right\" data-dismiss=\"alert\"><span aria-hidden=\"true\">&times;</span><span class=\"sr-only\">Close</span></button>#{message}</div>"  
    end

end
