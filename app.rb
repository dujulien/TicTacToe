require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/application'

# Créé une instance de la classe Application et lance l'application
app = Application.new
app.perform