class ContactsController < ApplicationController
  authorize_resource

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        UserMailer.contact_us_full(@contact).deliver

        format.html { redirect_to :back, notice: 'Vielen Dank für Ihre Anfrage, <br>wir werden uns gerne mit Ihnen in Verbindung setzen.<br>Ihr OPC Vertriebteam' }
      else
        format.html { render :index }
      end
    end
  end

private

  def contact_params
    params.require(:contact).permit(:name, :company, :email, :tel, :address, :message)
  end

end
