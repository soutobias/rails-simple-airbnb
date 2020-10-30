class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  before_action :empty_flat
  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def find_like
    @flats = Flat.where("name LIKE ?", params[:search])
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def empty_flat
    @empty_flat = Flat.new
  end

end