# encoding: UTF-8

Service.delete_all
Service.create(name: 'Lighting Design', description: 'some stuff')
Service.create(name: 'Lighting Hire', description: 'another description')
Service.create(name: 'Rigging Design', description: 'rigged')
Service.create(name: 'Rigging Hire', description: 'blah blah stuff')
Service.create(name: 'Pre-production and production management', description: 'test stuff')

Project.delete_all
Project.create(
name: 'Costa Conference',
who: 'Costa',
where: 'London Olympia',
what: 'All lighting provided',
when: '2011-12-29',
description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quam mi, fringilla eget semper nec, rutrum porta tellus. Donec malesuada quam in turpis dictum vel lacinia metus gravida. Ut nec orci urna.'
)


Project.create(
name: 'Olympics Party',
who: 'London 2012',
where: 'Manchester',
what: 'Audio Equipment',
when: '2012-01-20',
description: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
)

User.delete_all
User.create!(email: 'john@bitsushi.com', password: 'pass', password_confirmation: 'pass')

Ethos.delete_all
Ethos.create(headline: 'Equipment kept to highest standard', description: 'Our equipment will always be meticulously maintained and prepared, so it looks professional, is in perfect working condition and does your event justice.')
Ethos.create(headline: 'We try harder and go further than our competitors', description: "We know we're not the biggest lighting company around, hey, we're not even the biggest in Manchester, but this is why we try harder and go further than anyone else. We guarantee you won't get a better service from any other lighting company.")
Ethos.create(headline: 'Our attention to detail sets us apart', description: 'With so much going on at an event, it is easy to overlook the little details, which make the difference between a good event and a truly outstanding one. Our unrivalled attention to detail means that all your events will be memorable.')
Ethos.create(headline: 'From concept to creation, we\'re with you all the way', description: 'There will be times when you literally require us to turn up and provide the professional and efficient service you expect from us. There will also be times when you may want to get advice and ideas from us much earlier in the life of a project. Whatever stage you are at, we are here for you.')
Ethos.create(headline: 'To be fast and flexible', description: "We understand that organizing events can at times be stressful, to say the least. That is why we endeavor to be as fast and flexible with our service as possible. We believe that our size enables us to turn our 'ship' around much quicker than some of our 'tanker-sized' competitors.")
Ethos.create(headline: 'No job is considered too small nor too large', description: "However much of a cliché it sounds, we truly pride ourselves in providing services to any size of event and to any budget. Each event, big or small, is treated with equal respect and given the best customer service possible.")
Ethos.create(headline: 'To be as eco-friendly as possible', description: 'Being an environmentally conscious company we strive to be as energy efficient as possible, whilst expecting the same from our suppliers. UrbanLites happily supports any initiative which focuses on reducing human-induced climate change.')

