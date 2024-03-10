
secret = "puppies"
encrypted = BCrypt::Password.create(secret)
puts encrypted