class Customer < ApplicationRecord
    has_one :address, dependent: :destroy

    def print_info_to_console
        puts "Customer: #{first_name} #{last_name}"
        puts "Address: #{address.street_address}"
        puts "State: #{address.state}"
        puts "City: #{address.city}"
        puts "Zip: #{address.zip}"
    end
end
