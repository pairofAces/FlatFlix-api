# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


count = 0 
while Venue.all.length < 900 do
    venue_info["_embedded"]["venues"].each do |venue_array|
        Venue.create(name: venue_array["name"],
        city: venue_array["city"]["name"],
        address: venue_array["address"]["line1"])
    end
    venue_info = JSON.parse(RestClient.get("https://app.ticketmaster.com/discovery/v2/venues?&locale=*&stateCode=NY&page=#{count}" + "#{karan_api_key}"))
    count += 1
end