class User < ApplicationRecord
    has_many :todos
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    has_secure_password      
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns true if the given token matches the digest.
    def authenticated?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
    end
end
