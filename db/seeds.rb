Service.create(name: 'Lighting Design', description: 'some stuff')
Service.create(name: 'Lighting Hire', description: 'another description')
Service.create(name: 'Rigging Design', description: 'rigged')
Service.create(name: 'Rigging Hire', description: 'blah blah stuff')
Service.create(name: 'Pre-production and production management', description: 'test stuff')

Project.create(
name: 'Costa Conference',
who: 'Costa',
where: 'London Olympia',
what: 'All lighting provided',
when: '2011-12-29',
equipment_used: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras quam mi, fringilla eget semper nec, rutrum porta tellus. Donec malesuada quam in turpis dictum vel lacinia metus gravida. Ut nec orci urna.'
)

Project.create(
name: 'Olympics Party',
who: 'London 2012',
where: 'Manchester',
what: 'Audio Equipment',
when: '2012-01-20',
equipment_used: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
)

User.create!(email: 'john@bitsushi.com', password: 'pass', password_confirmation: 'pass')
