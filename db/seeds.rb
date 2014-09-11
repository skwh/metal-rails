# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
pages = Page.create(
	[
		{
			title:"Welcome to Metalithic Ironworks LLC",
			page_name:"home",
			rendered_text:"At Metalithic Ironworks our goal is to provide you with Quick, Professional and Outstanding Quality. We offer MIG, TIG, Flux Core, and Dual Shield Welding and Metal Fabrication with Aluminum, Steel, Stainless Steel and Wrought Iron.</p>\r\n\t<p>For Residential and Commercial customers we specialize in Ornamental Ironworks, such as: Gates, Railings, Fences, Fire Pits, Handrails, Fireplace Screens, Deck railing, Custom Furniture, Bed Frames, Architectural Pieces, Wine Cellar Doors, Entry and Interior Doors.\r\n\r\nFor Contractors and Builders we offer Industrial Fabrication of: Knee Walls, Awnings, Beams, Headers, Joists, Sign Frames, Trash and Cigarette Receptacles, Bulk Orders and Wholesale pricing available. We have the ability to fabricate whatever the job calls for and will have it ready on time and in accordance with building plans and applicable codes.\r\n\r\nFor Automotive Enthusiasts: Roll Cages, Strut and Sway Bars, Custom Axle Housings, Suspension set-ups, \"Back Halving\", Rock Skidders, Headache Racks, Roof Racks, Ladder Racks, Tire Carriers, Skid Plates, just about anything. We have created 2000 HP, Big Block, $500,000 Race Vehicles... Nothing is beyond our ability!"
		},
		{
			title:"About Metalithic Ironworks LLC",
			page_name:"about"
		},
		{
			title:"Contact Us",
			page_name:"contact"
		},
		{
			title:"Residential",
			page_name:"residential"
		},
		{
			title:"Commercial",
			page_name:"commercial"
		},
		{
			title:"Restaurants",
			page_name:"restaurants"
		},
		{
			title:"Contractors",
			page_name:"contractors"
		}
	]
)
puts("seeded pages")

password = Password.create({password_digest:"5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"})
puts("seeded password")