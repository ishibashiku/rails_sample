class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to "/contacts/new", notice: "お問い合わせを送信しました"
    else
      render 'new'
    end
  end

# postされたデータの取り出し
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end

end
