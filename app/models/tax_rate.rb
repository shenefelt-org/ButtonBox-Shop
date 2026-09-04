class TaxRate < ApplicationRecord
    has_many :orders, dependent: :destroy
    def self.get_rate(state_code: nil)
        state = find_by(abbreviation: state_code.upcase)
        return nil if state.nil?

        rate = (state&.rate * 100)
        (rate == 0) ? false : rate
    end
end
