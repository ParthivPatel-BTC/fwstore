# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


country_us_id = Shoppe::Country.find_by_code2('US').id
us_states_arr = [
{ country_id: country_us_id, code2: 'AL', name: 'Alabama' },
{ country_id: country_us_id, code2: 'AR', name: 'Arkansas' },
{ country_id: country_us_id, code2: 'CT', name: 'Connecticut' },
{ country_id: country_us_id, code2: 'FL', name: 'Florida' },
{ country_id: country_us_id, code2: 'ID', name: 'Idaho' },
{ country_id: country_us_id, code2: 'IA', name: 'Iowa' },
{ country_id: country_us_id, code2: 'LA', name: 'Louisiana' },
{ country_id: country_us_id, code2: 'MA', name: 'Massachusetts' },
{ country_id: country_us_id, code2: 'MS', name: 'Mississippi' },
{ country_id: country_us_id, code2: 'NE', name: 'Nebraska' },
{ country_id: country_us_id, code2: 'NJ', name: 'New Jersey' },
{ country_id: country_us_id, code2: 'NC', name: 'North Carolina' },
{ country_id: country_us_id, code2: 'OK', name: 'Oklahoma' },
{ country_id: country_us_id, code2: 'RI', name: 'Rhode Island' },
{ country_id: country_us_id, code2: 'TN', name: 'Tennessee' },
{ country_id: country_us_id, code2: 'VT', name: 'Vermont' },
{ country_id: country_us_id, code2: 'WV', name: 'West Virginia' },
{ country_id: country_us_id, code2: 'AK', name: 'Alaska' },
{ country_id: country_us_id, code2: 'CA', name: 'California' },
{ country_id: country_us_id, code2: 'DC', name: 'Dist. Columbia' },
{ country_id: country_us_id, code2: 'GA', name: 'Georgia' },
{ country_id: country_us_id, code2: 'IL', name: 'Illinois' },
{ country_id: country_us_id, code2: 'KS', name: 'Kansas' },
{ country_id: country_us_id, code2: 'ME', name: 'Maine' },
{ country_id: country_us_id, code2: 'MI', name: 'Michigan' },
{ country_id: country_us_id, code2: 'MO', name: 'Missouri' },
{ country_id: country_us_id, code2: 'NV', name: 'Nevada' },
{ country_id: country_us_id, code2: 'NM', name: 'New Mexico' },
{ country_id: country_us_id, code2: 'ND', name: 'North Dakota' },
{ country_id: country_us_id, code2: 'OR', name: 'Oregon' },
{ country_id: country_us_id, code2: 'SC', name: 'South Carolina' },
{ country_id: country_us_id, code2: 'TX', name: 'Texas' },
{ country_id: country_us_id, code2: 'VA', name: 'Virginia' },
{ country_id: country_us_id, code2: 'WI', name: 'Wisconsin' },
{ country_id: country_us_id, code2: 'AZ', name: 'Arizona' },
{ country_id: country_us_id, code2: 'CO', name: 'Colorado' },
{ country_id: country_us_id, code2: 'DE', name: 'Delaware' },
{ country_id: country_us_id, code2: 'HI', name: 'Hawaii' },
{ country_id: country_us_id, code2: 'IN', name: 'Indiana' },
{ country_id: country_us_id, code2: 'KY', name: 'Kentucky' },
{ country_id: country_us_id, code2: 'MD', name: 'Maryland' },
{ country_id: country_us_id, code2: 'MN', name: 'Minnesota' },
{ country_id: country_us_id, code2: 'MT', name: 'Montana' },
{ country_id: country_us_id, code2: 'NH', name: 'New Hampshire' },
{ country_id: country_us_id, code2: 'NY', name: 'New York' },
{ country_id: country_us_id, code2: 'OH', name: 'Ohio' },
{ country_id: country_us_id, code2: 'PA', name: 'Pennsylvania' },
{ country_id: country_us_id, code2: 'SD', name: 'South Dakota' },
{ country_id: country_us_id, code2: 'WA', name: 'Washington' },
{ country_id: country_us_id, code2: 'WY', name: 'Wyoming'
}]

def create_or_update_states(class_name, row)
  instance  = class_name.find_by_code2(row[:code2])
  if instance.present?
    instance.update_attributes(row)
    puts "#{row[:code2]} updated."
  else
    class_name.create!(row)
    puts "#{row[:code2]}  added."
  end
  instance
end

us_states_arr.each{ |state_map|
  create_or_update_states(Shoppe::State, state_map)
}



country_ca_id= Shoppe::Country.find_by_code2('CA').id
ca_states_arr = [
{ country_id: country_ca_id, code2: 'AB', name: 'Alberta' },
{ country_id: country_ca_id, code2: 'LB', name: 'Labrador' },
{ country_id: country_ca_id, code2: 'NB', name: 'New Brunswick' },
{ country_id: country_ca_id, code2: 'NS', name: 'Nova Scotia' },
{ country_id: country_ca_id, code2: 'NW', name: 'North West Terr.' },
{ country_id: country_ca_id, code2: 'PE', name: 'Prince Edward Is.' },
{ country_id: country_ca_id, code2: 'SK', name: 'Saskatchewen' },
{ country_id: country_ca_id, code2: 'BC', name: 'British Columbia' },
{ country_id: country_ca_id, code2: 'MB', name: 'Manitoba' },
{ country_id: country_ca_id, code2: 'NF', name: 'Newfoundland' },
{ country_id: country_ca_id, code2: 'NU', name: 'Nunavut' },
{ country_id: country_ca_id, code2: 'ON', name: 'Ontario' },
{ country_id: country_ca_id, code2: 'QC', name: 'Quebec' },
{ country_id: country_ca_id, code2: 'YU', name: 'Yukon'  }
]

ca_states_arr.each{ |state_map|
  create_or_update_states(Shoppe::State, state_map)
}