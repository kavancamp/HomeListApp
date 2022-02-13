class PropertiesController < ApplicationController
    before_action :authenticate_account!, only: [:new, :create, :destroy]
    before_action :set_property, only: [:show, :edit, :update, :destroy]
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
      if current_user.company_id == nil
        redirect_to user_edit_path(current_user.id), :flash => { :error => "Cannot List a new Property without a Company" }
        return
      end
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
        @sp = params.fetch(:search_params, {})
        @properties = Property.all
        @properties = @properties.where(:size => SIZE_MAPPING[@sp['size'].to_i][0]...SIZE_MAPPING[@sp['size'].to_i][1]) if @sp['size'].present?
        @properties = @properties.where(['address LIKE ?', "%#{@sp['address']}%"]) if @sp['address'].present? && @sp['address'] != ""
        @properties = @properties.where(:price => PRICE_MAPPING[@sp['price'].to_i][0]...PRICE_MAPPING[@sp['price'].to_i][1]) if @sp['price'].present?
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

      def set_sidebar
        @show_sidebar = true
      end

      def property_params
        params.require(:property).permit(:name, :address, :price, :photo, :bedrooms, :bathrooms, :photo_cache, :photo_url, :description)
      end
end