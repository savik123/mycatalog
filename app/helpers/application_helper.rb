module ApplicationHelper
  def favorite?(equipment)
    favorites = cookies[:favorites] ? JSON.parse(cookies[:favorites]) : []
    favorites.map(&:to_i).include?(equipment.id)
  end
end
