lauren = User.create(name: "Lauren", email: "lauren@lauren.com", password: "password")

batman = User.create(name: "Batman", email: "batman@batman.com", password: "password")

feed_pets = lauren.items.create(name: "Feed pets", description: "Use opened food first, please")

vacuum_cave = batman.items.create(name: "Vacuum batcave", description: "Don't forget underneath the batarang!")