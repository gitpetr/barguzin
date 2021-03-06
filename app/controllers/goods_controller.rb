class GoodsController < ApplicationController
  before_action :load_model, only: [:show, :edit, :update, :destroy]

  def index
    @goods = Good.order(:name).paginate(:page => params[:page])
  end

  def show
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new good_params
    if @good.save
      redirect_to goods_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @good.update good_params
      redirect_to goods_url
    else
      render :edit
    end
  end

  def destroy
    @good.destroy
    redirect_to goods_url
  end

  private

  def good_params
    params.require(:good).permit(:name, :comment)
  end

  def load_model
    @good = Good.find params[:id]
  end
end
