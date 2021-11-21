class PropertiesController < ApplicationController
    #before_action :set_property, only: [:show, :edit, :update, :destroy]
    #before_action :authenticate_account!, only: [:new, :create, :destroy]

    def index
        @properties = Property.all
    end

    def show
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
                format.html { redirect_to @property, notice: 'Success!.'}
                format.json { render :show, status: :created, location: @property}
            else
                format.html { render :new}
                format.json { render json: @property.errors, status: :unprocessable_entity}
            end
        end
    end

    #def update
        #respond_to do |format|
           # format.html {redirect_to @property, notice: 'Updated!'}
           # format.json { render :show, status: :ok, location: @property}
        #else
            #format.html {render :edit }
   # end
end