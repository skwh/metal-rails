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
			page_name:"index"
		},
		{
			title:"About Metalithic Ironworks LLC",
			page_name:"about"
		},
		{
			title:"Contact Us",
			page_name:"contact"
		}
	]
)
puts("seeded pages")

password = Password.create({password_digest:"5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8"})
puts("seeded password")