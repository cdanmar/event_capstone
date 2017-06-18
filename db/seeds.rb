Admin.create!([
  {name: "Carlos Martinez", email: "cdanmar@gmail.com", password_digest: "$2a$10$zQFkATcM5KsMymDZuCL3ouPCodlOPPNzaY1P.0QDloH/jYZyZXymG"},
  {name: "test", email: "test@test.com", password_digest: "$2a$10$conEteXTTqg1lDwhSeXx/OtL8pF2lqSEusZMKcnOO9vHBU4qb6EUC"}
])
Event.create!([
  {name: "Test Event", description: "My First Test Event", start_time: "2017-11-11 11:11:00", end_time: "2017-11-12 23:11:00"},
  {name: "Event 2", description: "Second Test Event", start_time: "2017-11-13 20:08:00", end_time: "2017-11-14 00:00:00"},
  {name: "alsdjflkaj", description: "dslzkfjasdlkfj", start_time: "2017-11-11 20:08:00", end_time: "2017-11-11 20:09:00"},
  {name: "asldkfjasfd", description: "adslfkja;lfj", start_time: "2017-11-12 21:00:00", end_time: nil},
  {name: "asldkfjasfd", description: "adslfkja;lfj", start_time: "2017-11-12 21:00:00", end_time: nil}
])
Visitor.create!([
  {name: "Carlos Martinez", email: "cdanmar@spamify.me", phone: "555-555-5555", identifier_key: nil}
])
