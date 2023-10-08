class Person
    attr_accessor :name, :age, :parent_permission
    attr_reader  :id

    def initialize(age, name = 'Unknown', parent_permission: true)
        @id = SecureRandom.hex(4)
        @name = name
        @age = age
        @parent_permission = parent_permission

    end

    private

    def of_age?
       return true if age >= 18
    end
    public
    def can_use_services?
        return true if of_age? || @parent_permission
    end
end