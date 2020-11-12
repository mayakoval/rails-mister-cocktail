class DosesController < ApplicationController
  def new
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	@dose = Dose.new
  	@ingredients = Ingredient.all
  end

  def create
  	# get cocktail_id from url, won't be needed in dose_param
  	@cocktail = Cocktail.find(params[:cocktail_id])
  	@dose = Dose.new(dose_params)
    # attach cocktail above to the new dose
  	@dose.cocktail = @cocktail

  	if @dose.save
  		redirect_to cocktail_path(@cocktail)
  	else
  		render :new
  	end
  end

  def destroy
  	@dose = Dose.find(params[:id])
  	@dose.destroy
  	redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
  	params.require(:dose).permit(:description, :ingredient_id)
  end
end
