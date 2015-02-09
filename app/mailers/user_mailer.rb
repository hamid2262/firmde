class UserMailer < ActionMailer::Base
  default from: "noreply@opc.de"

  def contact_us_full(contact)
    @contact = contact
    mail(from: 'homepage_anfrage@opc.de', to: "info@opc.de", subject: "Anfrage von Homepage" , locale: locale )
  end

end