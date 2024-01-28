# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Créer des CGP
cgp_paul = Cgp.create(nom: 'Pelerins', prenom: 'Paul', email: 'paul@cgp.com', telephone: '0651859244')
cgp_laetita = Cgp.create(nom: 'Schmidt', prenom: 'Laetita', email: 'laetita@cgp.com', telephone: '0631350517')

# Créer des utilisateurs correspondants
User.create(email: 'paul@cgp.com', password: '123456', password_confirmation: '123456', cgp_id: cgp_paul.id)
User.create(email: 'laetita@cgp.com', password: '123456', password_confirmation: '123456', cgp_id: cgp_laetita.id)
