class EquipmentsController < ApplicationController

  def index
    if params[:query].present?
      query = params[:query].downcase.strip
      q = "%#{query}%"

      @equipments = Equipment.where(
        "LOWER(name) LIKE :q OR LOWER(purpose) LIKE :q OR LOWER(description) LIKE :q OR LOWER(application) LIKE :q OR LOWER(keywords) LIKE :q",
        q: q
      )
    else
      @equipments = Equipment.all
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end
  def equipment_params
    params.require(:equipment).permit(
      :name,
      :purpose,
      :application,
      :description,
      :recommendations,
      :keywords
    )
  end
  def toggle_favorite
    favorites = cookies[:favorites] ? JSON.parse(cookies[:favorites]) : []

    if favorites.include?(params[:id])
      favorites.delete(params[:id])
    else
      favorites << params[:id]
    end

    cookies[:favorites] = favorites.to_json

    redirect_back(fallback_location: equipments_path)
  end

  def favorites
    favorites = cookies[:favorites] ? JSON.parse(cookies[:favorites]) : []
    @equipments = Equipment.where(id: favorites)
  end
end