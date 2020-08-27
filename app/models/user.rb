class User < ApplicationRecord
    has_many :contents
    has_secure_password
end
