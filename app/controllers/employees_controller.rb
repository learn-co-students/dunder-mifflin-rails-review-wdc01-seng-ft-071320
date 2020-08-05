class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
    end

    def create
        first_name = params[:employee][:first_name]
        last_name = params[:employee][:last_name]
        a = params[:employee][:alias]
        title = params[:employee][:title]
        office = params[:employee][:office]
        dog = Dog.find_by(name: params[:employee][:dog])
        img_url = params[:employee][:img_url]
        employee = Employee.create(
            first_name: first_name,
            last_name: last_name,
            alias: a,
            title: title,
            office: office,
            dog_id: dog.id,
            img_url: img_url
        )
        redirect_to employee_path(employee.id)
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def update
        @employee = Employee.find(params[:id])
        first_name = params[:employee][:first_name]
        last_name = params[:employee][:last_name]
        a = params[:employee][:alias]
        title = params[:employee][:title]
        office = params[:employee][:office]
        dog = Dog.find_by(name: params[:employee][:dog])
        img_url = params[:employee][:img_url]
        @employee.update_column(:first_name, first_name)
        @employee.update_column(:last_name, last_name)
        @employee.update_column(:alias, a)
        @employee.update_column(:title, title)
        @employee.update_column(:office, office)
        @employee.update_column(:dog_id, dog.id)
        @employee.update_column(:img_url, img_url)
        
        redirect_to employee_path(@employee.id)
    end

end
