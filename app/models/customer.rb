class Customer < ApplicationRecord
    belongs_to :address, dependent: :destroy
    has_many :quotes, dependent: :destroy
    has_many :orders, dependent: :destroy

    before_save :set_name
    before_save :format_phone_number

    # display generic info GS Testing Method
    def print_info_to_console
        puts "Customer: #{first_name} #{last_name}"
        puts "Address: #{address.street_address}"
        puts "State: #{address.state}"
        puts "City: #{address.city}"
        puts "Zip: #{address.zip}"
        puts "Total Orders: #{orders.count}"
    end

    private

    # fmt full name at save
    def set_name
        self.name = "#{first_name} #{last_name}"
    end

    # fmt num to (xxx) xxx-xxxx
    def format_phone_number
        self.phone = helpers.number_to_phone(phone, area_code: true)
    end
end
