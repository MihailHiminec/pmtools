class ContactsController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
    @search = ContactSearch.new filters: params[:f]
  end

  # GET /contact/1
  # GET /contact/1.json
  def show
    @contact = Contact.find(params[:id])
  end

  # GET /contact/new
  def new
    @contact = Contact.new
  end

  # GET /contact/1/edit
  def edit
  end

  # POST /contact
  # POST /contact.json
  def create
    @contact = current_user.contacts.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: 'Контакт добавлен!' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact/1
  # PATCH/PUT /contact/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Контакт обновлен!' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact/1
  # DELETE /contact/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to @contacts, notice: 'Контакт удален!' }
      format.json { head :no_content }
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit([ :name, :patronymic, :surname, :email, :phone, :birthday, :comment ])
  end

end
