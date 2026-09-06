class CustomersController < ApplicationController
    # limit member actions so the index doesn't try and set the customer object as there will be no global @customer to set at index
    before_action :set_customer, only: [ :show, :edit, :update, :destroy ]

    def index 
        @customers = Customer.all
    end
    
    private
    # concat users fname at save.
    def set_name
        return nil if first_name.nil? || last_name.nil?

        update(name: "#{first_name} #{last_name}")
    end

    def set_customer
        @customer = Customer.find(params[:id])
    end
end
