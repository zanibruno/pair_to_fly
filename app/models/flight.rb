class Flight < ApplicationRecord
    belongs_to :category
    belongs_to :user, foreign_key: 'creator_id'
    has_many :joined_flights, foreign_key: 'joined_flights_id'
    has_many :joined_pilots, through: :joined_flights

    validates_associate :category, message: "this category already exists or format entered is invalid"
    validates :location, length: {minimum: 3}
    validates :title, length: {minimum: 3}
    validate :start_date_cannot_be_in_the_past
    validate :start_time_cannot_be_in_the_past

    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date < Date.today
            errors.add(:start_date, "Cannot be in the past.")
        end 
    end  
    
    def start_time_cannot_be_in_the_past
        if start_time.present? && start_time < Time.now 
            erros.add(:start_time, "Cannot be in the past.")
        end 
    end 

    def 

        def join_flight(pilot) 
            self.joined_pilots << pilot 
        end 

        def leave_flight(pilot) 
            self.joined_pilots.delete(pilot)
        end 

end
