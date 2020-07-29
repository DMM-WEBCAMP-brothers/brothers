class ShippingsController < ApplicationController
before_action :authenticate_member!
  def index
    @shipping = Shipping.new
    @member = current_member
    @shippings = Shipping.where(member_id: current_member.id)
  end
  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.member_id = current_member.id
    if @shipping.save
    redirect_to shippings_path, notice: 'successfully'
    else
    redirect_to shippings_path
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
      params.require(:shipping).permit(:postcode, :address, :name, :member_id)
  end
end
