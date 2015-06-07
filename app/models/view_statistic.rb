class ViewStatistic < ActiveRecord::Base

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.filter_crawlers
      all_crawlers = Crawler.all

      crawler_ips = all_crawlers.map{|c| c.ip}
      heads       = all_crawlers.map{|c| c.head}
      heads.delete nil

      where.not(viewer_ip: crawler_ips).where.not(head: heads)
  end 

  def self.for_one_day(one_day)
    view_statistics = ViewStatistic.where("created_at>? and created_at<?", (one_day), (one_day + 1.day))
    view_statistics.filter_crawlers
  end


end
