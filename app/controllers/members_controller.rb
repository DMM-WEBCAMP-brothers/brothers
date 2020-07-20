class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:notice] = "登録情報を更新しました！"
      redirect_to member_path(@member.id)
    else
      render :edit
    end
  end

  def withdrawal
  end

  def hide
  end

  private
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number)
  end
end
