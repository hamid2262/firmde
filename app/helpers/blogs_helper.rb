module BlogsHelper
  
  def brief_text blg
    if blg.brief_txt.present?
      blg.brief_txt
    else
      truncate_html(blg.body, length: 240, omission: '...')
    end
  end

end
