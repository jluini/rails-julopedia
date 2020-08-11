# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

materias_cbc = JulopediaNode.create_with_defaults(
  name: 'cbc',
  kind: 'section',
  title: 'Materias del CBC',
  content: 'Insert content here...'
)

###

biofisica = JulopediaNode.create_with_defaults(
  parent: materias_cbc,
  name: 'biofisica',
  kind: 'subject',
  title: 'Biofísica CBC',
  content: 'Insert content here...'
)

mecanica = JulopediaNode.create_with_defaults(
  parent: biofisica,
  name: 'mecanica',
  kind: 'section',
  title: 'Unidad 1: mecánica',
  content: 'Insert content here...'
)

_cinematica = JulopediaNode.create_with_defaults(
  parent: mecanica,
  name: 'cinematica',
  kind: 'section',
  title: 'Cinemática',
  content: 'Insert content here...'
)

_dinamica = JulopediaNode.create_with_defaults(
  parent: mecanica,
  name: 'dinamica',
  kind: 'section',
  title: 'Dinámica',
  content: 'Insert content here...'
)

fluidos = JulopediaNode.create_with_defaults(
  parent: biofisica,
  name: 'fluidos',
  kind: 'section',
  title: 'Unidad 2: fluidos',
  content: 'Insert content here...'
)

_intro_fluidos = JulopediaNode.create_with_defaults(
  parent: fluidos,
  name: 'intro',
  kind: 'section',
  title: 'Introducción',
  content: 'Insert content here...'
)

###

quimica = JulopediaNode.create_with_defaults(
  parent: materias_cbc,
  name: 'quimica',
  kind: 'subject',
  title: 'Química CBC',
  content: 'Insert content here...'
)

_mam = JulopediaNode.create_with_defaults(
  parent: quimica,
  name: 'magnitudes',
  kind: 'section',
  title: 'Magnitudes atómico-moleculares',
  content: 'Insert content here...'
)
