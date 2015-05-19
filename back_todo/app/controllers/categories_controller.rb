class CategoriesController < ApplicationController
	def new
		categories = Category.new(permit)
  		if categories.valid?
  			categories.save
  			render json: categories
  		else
  			render json: categories.errors
  		end
	end
	def list
		categories = Category.all
		if categories == nil
			render json: {"error" => "No existen categories"}
		else
		render json: categories		
		end
	end

	def show
		exist = Category.exists?(params[:id].to_i)
  	if exist
  		objeto = Category.find(params[:id].to_i)
  		render json: objeto
  	else
  		render json:  {"error"=> "La categoria no existe"}
  	end
	end
	def update
  	exist = Category.exists?(params[:id].to_i)
  	if exist
  		objeto = Category.update(params[:id].to_i,permit)
  		render json: objeto
  	else
  		render json:  {"error"=> "La categoria no existe"}
  	end
  end
  def delete
    exist = Category.exists?(params[:id])
    if exist
      objeto = Category.destroy(params[:id])
      render json: {"mensaje"=> "Categoria borrada"}
    else
      render json: {"Error" => "La categoria no existe"}
    end
  end
	private
		def permit
			params.permit(:name)
		end
end
