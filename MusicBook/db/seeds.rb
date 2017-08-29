# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: 'testni',last_name: 'user', username: 'testni', email: 'test@test.com', password_digest:'$2a$10$0aSIEhoTs9f3lnLcitgGU.twiiBD3O7aYyvUBzHW.EJpMEPLLNIMa', role: 0)
User.create(first_name: 'testni',last_name: 'admin', username: 'admin', email: 'testadmin@test.com', password_digest:'$2a$10$0aSIEhoTs9f3lnLcitgGU.twiiBD3O7aYyvUBzHW.EJpMEPLLNIMa', role: 1)
User.create(first_name: 'testni',last_name: 'superadmin', username: 'superadmin', email: 'testsuperadmin@test.com', password_digest:'$2a$10$0aSIEhoTs9f3lnLcitgGU.twiiBD3O7aYyvUBzHW.EJpMEPLLNIMa', role: 2)

Genre.create(name: 'pop', description: 'pop music', user_id: 2)
Genre.create(name: 'rock', description: 'rock music', user_id: 3)

Artist.create(name: 'Michael Jackson', dob:'1950-01-01', placeOfBirth: 'America', state: 'USA', address: 'unknown', user_id: 2)
Artist.create(name: 'Witney Houston', dob:'1952-05-07', placeOfBirth: 'America', state: 'USA', address: 'unknown', user_id: 2)

Album.create(name: 'album 1', year: 2012, artist_id: 1, user_id: 2)
Album.create(name: 'album 2', year: 2000, artist_id: 2, user_id: 3)

Song.create(name: 'Smooth criminal', artist_id: 1, album_id: 1, genre_id: 1, duration: 300, ytlink: 'https://www.youtube.com/watch?v=h_D3VFfhvs4', user_id: 2)
Song.create(name: 'I wanna dance with somebody', artist_id: 2, album_id: 2, genre_id: 2, duration: 400, ytlink: 'https://www.youtube.com/watch?v=eH3giaIzONA', user_id: 3)