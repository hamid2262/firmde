class Navbar < Page

  def self.partner_area_exist?
    Page.find_by(title: "Partner-Area")
  end
  
  def self.partner_area
    Page.find_by(title: "Partner-Area")
  end

  def self.home
    Page.find_by(title: "home")
  end
end