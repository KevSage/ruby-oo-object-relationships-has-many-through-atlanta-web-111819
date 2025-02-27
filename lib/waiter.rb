class Waiter
    attr_reader :name, :years_of_experience
    @@all = []

    def initialize(name, years_of_experience)
     @name = name
     @years_of_experience = years_of_experience
     @@all << self
    end

    def self.all
        @@all 
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
       top_tipper = meals.max do |tip1, tip2|
        tip1.tip <=> tip2.tip
       end
       top_tipper.customer
    end
end

