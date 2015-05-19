class TasksController < ApplicationController
	def list
		task = nil
		if params[:category].nil?
			task = Task.all
		else
			task = Task.where("category_id" => params[:category].to_i)
		end
		render json: task		
	end
	def new
		task = Task.new(permit)
		if task.valid? 
			task.save
			render json: task
		else
			render json: task.errors
		end
	end

	def show
		valid = Task.exists?((params[:id].to_i))
		if valid
			task = Task.find((params[:id].to_i))
			render json: task.to_json
		else
			render json: {"Error" => "Error 404 La Tarea no existe"}
		end

	end
	def delete
		valid =  Task.exists?((params[:id].to_i))
		if valid
			task = Task.find((params[:id].to_i))
			task.delete
			render json: task.to_json
		else
			render json: {"Error" => "Error 404 La Tarea no existe"}
		end
	end

	def update
		valid = Task.exists?(params[:id].to_i)
		if valid
			task = Task.update(params[:id].to_i, permit)
			render json: task
			
		else
			render json: {"Error" => "Error 404 la tarea no existe"}
		end
	end

	def finish
		valid = Task.exists?(params[:id].to_i)
		if valid 
			task = Task.find((params[:id].to_i))
			if task{"status"} == "done"
				status = {"status" => "undone"}
			else
				status = {"status" => "done"}
			end
			task = Task.update(params[:id], status)
			render json: task
		else
			render json: {"Error" => "Error 404 la tarea no existe"}
		end
	end
	def status_list
		status = params[:status]
		case status
			when "finish"
				task = Task.where("status" => "done")
				render json: task		
			when "pending"
				task = Task.where("status" => "undone")
				render json: task	
			else
				render json: {"Error" => "El estatus no existe"}
		end
				
	end

	private
		def permit
			params.permit(:title, :date, :status, :priority, :category_id)
		end	
end
