class UserMailer < ActionMailer::Base

  def contact_us_full(contact)
    @contact = contact
    mail(from: 'homepage_anfrage@opc.de', cc: "webanfrage@opc.de",to: "info@opc.de", subject: "Anfrage von Homepage www.opc.de" , locale: locale )
  end

  def send_to_me(contact)
    @contact = contact
    mail(from: 'opc@opc.de',to: "hrmohseni@yahoo.com", subject: "www.opc.de" , locale: locale, template_name: :contact_us_full )
  end
end