Admin.create!([
  {name: "Carlos Martinez", email: "cdanmar@gmail.com", password_digest: "$2a$10$zQFkATcM5KsMymDZuCL3ouPCodlOPPNzaY1P.0QDloH/jYZyZXymG"},
  {name: "test", email: "test@test.com", password_digest: "$2a$10$conEteXTTqg1lDwhSeXx/OtL8pF2lqSEusZMKcnOO9vHBU4qb6EUC"}
])
Event.create!([
  {name: "Test Event", description: "My First Test Event", start_time: "2017-11-11 11:11:00", end_time: "2017-11-12 23:11:00"},
  {name: "Event 2", description: "Second Test Event", start_time: "2017-11-13 20:08:00", end_time: "2017-11-14 00:00:00"},
  {name: "Potato Judging", description: "Best potato wins", start_time: "2017-07-04 11:00:00", end_time: "2017-07-04 22:00:00"},
  {name: "Fidget Toy Consortium", description: "New advances in fidget toy technology", start_time: "2017-11-11 08:08:00", end_time: "2017-11-11 20:08:00"},
  {name: "Event for Capstone Testing 1", description: "This event will be used to test functionality of the capstone. It will last a month, and should allow visitors to check in and out.", start_time: "2017-06-29 12:00:00", end_time: "2017-08-01 00:00:00"}
])
ListedParticipant.create!([
  {visitor_id: 3, event_id: 7, access_level: nil, check_in: nil, check_out: nil},
  {visitor_id: 5, event_id: 8, access_level: nil, check_in: nil, check_out: nil},
  {visitor_id: 6, event_id: 8, access_level: nil, check_in: nil, check_out: nil},
  {visitor_id: 1, event_id: 1, access_level: nil, check_in: nil, check_out: nil},
  {visitor_id: 1, event_id: 8, access_level: nil, check_in: nil, check_out: nil},
  {visitor_id: 2, event_id: 2, access_level: nil, check_in: "2017-06-29 02:27:26", check_out: nil},
  {visitor_id: 1, event_id: 10, access_level: nil, check_in: "2017-07-02 19:35:35", check_out: nil}
])
Visitor.create!([
  {name: "Carlos Martinez", email: "cdanmar@spamify.me", phone: "555-555-5555", identifier_key: nil},
  {name: "Visitor 2", email: "visitor2@visitor.com", phone: "555-555-5556", identifier_key: nil},
  {name: "Mr. Potato Judge", email: "judge@potato.com", phone: "555-555-7777", identifier_key: nil},
  {name: "Engie FidgetMaker", email: "efig@spamify.me", phone: "555-555-8888", identifier_key: nil},
  {name: "Joe FidgetVisit", email: "jfidget@spamify.me", phone: "555-555-999", identifier_key: nil}
])
