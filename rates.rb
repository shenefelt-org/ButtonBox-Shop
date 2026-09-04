puts "Seeding state sales tax rates with abbreviations..."

tax_rates = [
  { state: "Alabama", abbreviation: "AL", rate: 0.04 },
  { state: "Alaska", abbreviation: "AK", rate: 0.0 },
  { state: "Arizona", abbreviation: "AZ", rate: 0.056 },
  { state: "Arkansas", abbreviation: "AR", rate: 0.065 },
  { state: "California", abbreviation: "CA", rate: 0.0725 },
  { state: "Colorado", abbreviation: "CO", rate: 0.029 },
  { state: "Connecticut", abbreviation: "CT", rate: 0.0635 },
  { state: "Delaware", abbreviation: "DE", rate: 0.0 },
  { state: "Florida", abbreviation: "FL", rate: 0.06 },
  { state: "Georgia", abbreviation: "GA", rate: 0.04 },
  { state: "Hawaii", abbreviation: "HI", rate: 0.04 },
  { state: "Idaho", abbreviation: "ID", rate: 0.06 },
  { state: "Illinois", abbreviation: "IL", rate: 0.0625 },
  { state: "Indiana", abbreviation: "IN", rate: 0.07 },
  { state: "Iowa", abbreviation: "IA", rate: 0.06 },
  { state: "Kansas", abbreviation: "KS", rate: 0.065 },
  { state: "Kentucky", abbreviation: "KY", rate: 0.06 },
  { state: "Louisiana", abbreviation: "LA", rate: 0.05 },
  { state: "Maine", abbreviation: "ME", rate: 0.055 },
  { state: "Maryland", abbreviation: "MD", rate: 0.06 },
  { state: "Massachusetts", abbreviation: "MA", rate: 0.0625 },
  { state: "Michigan", abbreviation: "MI", rate: 0.06 },
  { state: "Minnesota", abbreviation: "MN", rate: 0.06875 },
  { state: "Mississippi", abbreviation: "MS", rate: 0.07 },
  { state: "Missouri", abbreviation: "MO", rate: 0.04225 },
  { state: "Montana", abbreviation: "MT", rate: 0.0 },
  { state: "Nebraska", abbreviation: "NE", rate: 0.055 },
  { state: "Nevada", abbreviation: "NV", rate: 0.0685 },
  { state: "New Hampshire", abbreviation: "NH", rate: 0.0 },
  { state: "New Jersey", abbreviation: "NJ", rate: 0.06625 },
  { state: "New Mexico", abbreviation: "NM", rate: 0.04875 },
  { state: "New York", abbreviation: "NY", rate: 0.04 },
  { state: "North Carolina", abbreviation: "NC", rate: 0.0475 },
  { state: "North Dakota", abbreviation: "ND", rate: 0.05 },
  { state: "Ohio", abbreviation: "OH", rate: 0.0575 },
  { state: "Oklahoma", abbreviation: "OK", rate: 0.045 },
  { state: "Oregon", abbreviation: "OR", rate: 0.0 },
  { state: "Pennsylvania", abbreviation: "PA", rate: 0.06 },
  { state: "Rhode Island", abbreviation: "RI", rate: 0.07 },
  { state: "South Carolina", abbreviation: "SC", rate: 0.06 },
  { state: "South Dakota", abbreviation: "SD", rate: 0.042 },
  { state: "Tennessee", abbreviation: "TN", rate: 0.07 },
  { state: "Texas", abbreviation: "TX", rate: 0.0625 },
  { state: "Utah", abbreviation: "UT", rate: 0.061 },
  { state: "Vermont", abbreviation: "VT", rate: 0.06 },
  { state: "Virginia", abbreviation: "VA", rate: 0.053 },
  { state: "Washington", abbreviation: "WA", rate: 0.065 },
  { state: "West Virginia", abbreviation: "WV", rate: 0.06 },
  { state: "Wisconsin", abbreviation: "WI", rate: 0.05 },
  { state: "Wyoming", abbreviation: "WY", rate: 0.04 }
]

tax_rates.each do |data|
  tax_rate = TaxRate.find_or_initialize_by(state: data[:state])
  tax_rate.update!(
    abbreviation: data[:abbreviation],
    rate: data[:rate]
  )
end

puts "Seeded #{TaxRate.count} state tax rates successfully."