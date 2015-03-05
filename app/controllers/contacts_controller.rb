class ContactsController < ApplicationController
  layout "admin_layout", only: [:index]
  authorize_resource

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        UserMailer.contact_us_full(@contact).deliver

        format.html { redirect_to :back, notice: 'Vielen Dank für Ihre Anfrage, <br>wir werden uns gerne mit Ihnen in Verbindung setzen.<br>Ihr OPC Vertriebsteam' }
      else
        format.html { render :index }
      end
    end
  end

  def index
    @contacts = Contact.order("updated_at desc")
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to :back, notice: 'contact was successfully destroyed.'
  end

private

  def contact_params
    params.require(:contact).permit(:name, :company, :email, :tel, :address, :message)
  end

end
