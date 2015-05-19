class UserMailer < ActionMailer::Base
  default from: "noreply@opc.de"

  def contact_us_full(contact)
    @contact = contact
    mail(from: 'webanfrage@opc.de', to: "info@opc.de", subject: "Anfrage von Homepage www.opc.de" , locale: locale )
  end

end