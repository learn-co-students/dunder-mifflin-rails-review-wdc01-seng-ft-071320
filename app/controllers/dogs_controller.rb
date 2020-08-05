class DogsController < ApplicationController
    def index
        @dogs = Dog.all
        if params[:order_asc] == "true"
            @dogs = Dog.joins(:employees).order('COUNT(employees.id) ASC').group(:dog_id)
        elsif params[:order_asc] == 'false'
            @dogs = Dog.joins(:employees).order('COUNT(employees.id) DESC').group(:dog_id)
        else
            @dogs = Dog.all
        end
    end

    def show
        @dog = Dog.find(params[:id])
    end
end
