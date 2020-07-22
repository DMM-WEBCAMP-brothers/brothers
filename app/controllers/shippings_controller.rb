class ShippingsController < ApplicationController

  def index
    @shipping = Shipping.new
    @member = current_member
    @shippings = @member.shippings
  end
  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.member_id = current_member.id
    if @shipping.save
    redirect_to shippings_path, notice: 'successfully'
    else
    @shipping = Shipping.new
    @shippings = Shipping.all
    @member = Menber.find(current_member.id)
    render :index
    end
  end
    def edit
    @shipping = Shipping.find(params[:id])
    @member = @shipping.member
  end

  def update
     @shipping = Shipping.find(params[:id])
     if @shipping.update(shipping_params)
     redirect_to shippings_path
     else
     render :edit
     end
  end

  def destroy
    shipping = Shipping.find(params[:id])
    shipping.destroy
    redirect_to shippings_path
  end
  private
  def shipping_params
      params.require(:shipping).permit(:postcode, :name, :address)
  end
end
