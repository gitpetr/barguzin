class GroupsCounterpartiesController < ApplicationController
  before_action :load_model, only: [:show, :edit, :update, :destroy]

  def index
    @groups_counterparties = GroupsCounterparty.order(:name).paginate(:page => params[:page])
  end

  def show
  end

  def new
    @groups_counterparty = GroupsCounterparty.new
  end

  def create
    @groups_counterparty = GroupsCounterparty.new groups_counterparty_params
    if @groups_counterparty.save
      redirect_to groups_counterparties_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @groups_counterparty.update groups_counterparty_params
      redirect_to groups_counterparties_url
    else
      render :edit
    end
  end

  def destroy
    @groups_counterparty.destroy
    redirect_to groups_counterparties_url
  end

  private

  def groups_counterparty_params
    params.require(:groups_counterparty).permit(:name, :comment)
  end

  def load_model
    @groups_counterparty = GroupsCounterparty.find params[:id]
  end
end
