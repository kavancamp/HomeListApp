class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_account!, only: [:new, :create, :destroy]

    #commenting out to fix at a later time 
    #protect_from_forgery unless: -> { @authenticated_by.oauth? }

       # private
        #def authenticate
           # if oauth_request?
            # authenticate with oauth
            #@authenticated_by = 'oauth'.inquiry
          #  else
            # authenticate with cookies
           # @authenticated_by = 'cookie'.inquiry
           # end
        #end
   

    def index
        @properties = Property.all
    end

    def show
        @agent=@property.account
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

    def destroy
        @property.destroy
        respond_to do |format|
            format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
     params.require(:property).permit(:title, :address, :price, :bedrooms, :bathrooms, :photo, :details, :price, :for_sale, :avaliable_date, :status )
    end

   
end