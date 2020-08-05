class Dog < ApplicationRecord

    def employees
        Employee.where(dog: self.id)
    end
end
