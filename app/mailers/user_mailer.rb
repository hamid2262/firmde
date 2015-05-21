class UserMailer < ActionMailer::Base

  def contact_us_full(contact)
    @contact = contact
    mail(from: 'homepage_anfrage@opc.de', cc: "webanfrage@opc.de",to: "info@opc.de", subject: "Anfrage von Homepage www.opc.de" , locale: locale )
  end

end