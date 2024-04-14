class V1::TodosController < ApplicationController
    def index
        todo = Todo.all
        render json: todo
    end

    def create
        todo = Todo.new(todo_params)
        if todo.save
            render json: todo
        else
            render json: todo.errors
        end

        puts params
    end

    def update
        todo = Todo.find(params[:id])
        todo.update(todo_params)
        if todo.errors.present?
            render json: {error_msg: todo.errors.full_messages, todo: todo}, status: :unprocessable_entity
        else
            render json: todo
        end
    end

    def destroy
        todo = Todo.find(params[:id])
        if todo.destroy
            render json: todo
        end
    end

    private
    
    def todo_params
        # binding.pry
        params.require(:todo).permit(:id, :title, :user_id)
    end
end
