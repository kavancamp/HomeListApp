class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  before_action :authenticate_account!, except: [:show, :email_agent, :view_all]
  before_action :account_owns_property?, only: [:edit, :update, :detroy]
  before_action :set_sidebar, except: [:show]
   

    def index
        @properties = Property.all
        @properties_by_account = Property.where(account_id: current_account)
    end

    def show
        @agent = @property.account
        @agent_properties = Property.where(account_id: @agent.id).where.not(id: @property.id)
    end

    def new
      @property = Property.new
    end

    def edit
    end

    def create
        @property = Property.new(property_params)
        @property.account_id = current_account.id
        respond_to do |format|
          if @property.save
            format.html { redirect_to @property, notice: 'Property was successfully created.' }
            format.json { render :show, status: :created, location: @property }
          else
            format.html { render :new }
            format.json { render json: @property.errors, status: :unprocessable_entity }
          end
        end
      end

    def update
        respond_to do |format|
          if @property.update(property_params)
            format.html { redirect_to @property, notice: 'Property was successfully updated.' }
            format.json { render :show, status: :ok, location: @property }
          else
            format.html { render :edit }
            format.json { render json: @property.errors, status: :unprocessable_entity }
          end
        end
      end

      def search 
        if params[:search].blank? 
          redirect_to properties_path and return
        else 
            @parameter = params[:search].downcase
            @results = Property.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
        end
      end

      def view_all
        @latest_properties = Property.available.latest
      end
      
      def destroy
        @property.destroy
        respond_to do |format|
          format.html { redirect_to properties_url, notice: "Property was successfully deleted." }
          format.json { head :no_content }
        end
      end

      def email_agent
        agent_id = params[:agent_id]
        name = params[:sender_name]
        email = params[:sender_email]
        message = params[:sender_message]
    
        ContactMailer.email_agent(agent_id, name, email, message).deliver_now
    
        respond_to do |format|
          format.json { head :no_content }
        end
    
      end


    private
      def set_property
        @property = Property.find(params[:id])
      end

      def set_sidebar
        @show_sidebar = true
      end

      def property_params
        params.require(:property).permit(:name, :address, :price, :photo, :bedrooms, :bathrooms, :for_sale, :photo_cache, :photo_url, :available_date, :available, :status, :parking_spaces, :description)
      end

      
    def account_owns_property?
      if @property.account_id != current_account.id 
        redirect_to properties_path, alert: "The property isnt yours." and return
      end
    end
end