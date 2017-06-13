# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
big   = User.create! name: 'The Notorious B.I.G.'
snoop = User.create! name: 'Snoop Dogg'
flex  = User.create! name: 'Funkmaster Flex'
ice   = User.create! name: 'Ice Cube'

Message.create! title: 'Tha Shiznit', content: 'Poppin, stoppin, hoppin like a rabbit', user: snoop
Message.create! title: 'Hypnotize ', content: 'Hah, sicker than your average Poppa', user: big
