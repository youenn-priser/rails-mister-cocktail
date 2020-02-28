class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all.order(:name)
    @search = params['search']
    if @search.present?
      @name = @search['name']
      @cocktails = Cocktail.where('name ILIKE ?', @name)
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(
      :name, :photo,
      doses_attributes: %i[description ingredient_id]
    )
  end
end
