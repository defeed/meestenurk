class PaymentMethodsController < ApplicationController
  before_filter :get_brands_and_categories
  before_filter :authorize
  before_filter :get_cart
  # GET /payment_methods
  # GET /payment_methods.json
  def index
    @title = "Payment Methods"
    
    @payment_methods = PaymentMethod.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payment_methods }
    end
  end

  # GET /payment_methods/new
  # GET /payment_methods/new.json
  def new
    @payment_method = PaymentMethod.new
    @title = "New Payment Method"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment_method }
    end
  end

  # GET /payment_methods/1/edit
  def edit
    @payment_method = PaymentMethod.find(params[:id])
    @title = @payment_method.name
  end

  # POST /payment_methods
  # POST /payment_methods.json
  def create
    @payment_method = PaymentMethod.new(params[:payment_method])

    respond_to do |format|
      if @payment_method.save
        format.html { redirect_to payment_methods_path, notice: "Payment Method #{@payment_method.name} was added." }
        format.json { render json: @payment_method, status: :created, location: @payment_method }
      else
        format.html { render action: "new" }
        format.json { render json: @payment_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payment_methods/1
  # PUT /payment_methods/1.json
  def update
    @payment_method = PaymentMethod.find(params[:id])

    respond_to do |format|
      if @payment_method.update_attributes(params[:payment_method])
        format.html { redirect_to payment_methods_path, notice: "Payment Method #{@payment_method.name} was updated." }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_methods/1
  # DELETE /payment_methods/1.json
  def destroy
    @payment_method = PaymentMethod.find(params[:id])

    respond_to do |format|
      format.html { redirect_to payment_methods_url, notice: "Payment Method #{@payment_method.name} was removed." }
      format.json { head :no_content }
    end
    
    @payment_method.destroy
  end
end
