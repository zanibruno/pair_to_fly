class Category < ApplicationRecord
    has_many :flights

    validates :name ,presence: true
    validates :category_is_not_on_the_list, on :create

    private 

    def category_is_not_on_the_list 
        if Category.all.any? { |category| category.name == self.name == self.name.upcase! || category.name == self.name.downcase! } 
            errors.add(:name, "is on the list. Please choose it from the dropdown menu.")
        end 
    end 
    
    

   
            
end
