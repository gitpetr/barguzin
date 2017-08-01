class CounterpartiesController < ApplicationController
  before_action :load_model, only: [:show, :edit, :update, :destroy]

  def index
    @counterparties = Counterparty.order(:name).paginate(:page => params[:page])
  end

  def show
  end

  def new
    @counterparty = Counterparty.new
  end

  def create
    @counterparty = Counterparty.new counterparty_params
    if @counterparty.save
      redirect_to counterparties_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @counterparty.update counterparty_params
      redirect_to counterparties_url
    else
      render :edit
    end
  end

  def destroy
    @counterparty.destroy
    redirect_to counterparties_url
  end

  private

  def counterparty_params
    params.require(:counterparty).permit(:name, :comment, :groups_counterparty_id)
  end

  def load_model
    @counterparty = Counterparty.find params[:id]
  end
end
