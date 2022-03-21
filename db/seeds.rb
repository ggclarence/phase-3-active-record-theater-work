Role.destroy_all
Audition.destroy_all

role1 = Role.create(character_name: "brandon")

Audition.create(actor: "so so", location: "nyc", phone: 21346, hired: false, role_id: role1.id)

