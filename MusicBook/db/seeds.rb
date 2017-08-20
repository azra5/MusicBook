# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: 'testni',last_name: 'user', username: 'testni', email: 'test@test.com', password_digest:'$2a$10$0aSIEhoTs9f3lnLcitgGU.twiiBD3O7aYyvUBzHW.EJpMEPLLNIMa', role: 0)
User.create(first_name: 'testni',last_name: 'admin', username: 'admin', email: 'testadmin@test.com', password_digest:'$2a$10$0aSIEhoTs9f3lnLcitgGU.twiiBD3O7aYyvUBzHW.EJpMEPLLNIMa', role: 0)
User.create(first_name: 'testni',last_name: 'superadmin', username: 'superadmin', email: 'testsuperadmin@test.com', password_digest:'$2a$10$0aSIEhoTs9f3lnLcitgGU.twiiBD3O7aYyvUBzHW.EJpMEPLLNIMa', role: 0)
