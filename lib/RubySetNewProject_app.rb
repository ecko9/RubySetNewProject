####### VERIFIE SI AU MOINS 1 INPUT
def check_input
  abort("ERREUR: Veuillez saisir le nom du dossier (ex: 'PROJET_1') puis le lien du repository github ") if ARGV.empty?
end

####### RECUPERE INPUT DU NOM DE DOSSIER
####### RENVOI UNE CHAINE DE CARACTERES AVEC L'INPUT
def get_input_dir
  return input_dir = ARGV.first.to_s
end

####### RECUPERE INPUT DU LIEN GITHUB
####### RENVOI UNE CHAINE DE CARACTERES AVEC L'INPUT
def get_input_git
  return input_git = ARGV[1]
end

####### CREER UN DOSSIER AU NOM DE LA CHAINE D'INPUTS
####### CREER UN DOSSIER "lib" DANS LE NOUVEAU DOSSIER 
def new_dir
  Dir.mkdir(get_input_dir)
  Dir.mkdir("./#{get_input_dir}/lib")
  Dir.mkdir("./#{get_input_dir}/db")
  Dir.mkdir("./#{get_input_dir}/lib/views")
end

####### INITIALISE GIT
def git_init
  Dir.chdir("./#{get_input_dir}/"){%x[#{"git init"}]}
  #system("git init ")
  Dir.chdir("./#{get_input_dir}/"){%x[#{"git remote add origin #{get_input_git}"}]}
  #system("git remote add origin #{get_input_git}")
  file = File.open("./#{get_input_dir}/.gitignore", "w")
  file.puts(".env")
  file.close
end

####### CREER LES FICHIERS Gemfile + .env + README.md
def new_dir_files
  # GEMFILE
  file = File.open("./#{get_input_dir}/Gemfile", "w")
  file.puts("source 'https://rubygems.org'")
  file.puts("ruby '2.7.1'")
  file.puts("gem 'bundler'")
  file.puts("gem 'rspec'")
  file.puts("gem 'pry'")
  file.puts("gem 'nokogiri'")
  file.puts("gem 'open-uri'")
  file.puts("gem 'watir'")
  file.puts("gem 'dotenv'")
  file.puts("gem 'twitter'")
  file.puts("gem 'rubocop', '~> 0.57.2'")
  file.puts("gem 'json'")
  file.puts("gem 'google_drive'")
  file.puts("gem 'csv'")
  file.puts("gem 'sinatra'")
  file.puts("gem 'shotgun'")
  file.close

  # .ENV
  file = File.open("./#{get_input_dir}/.env", "w")
  file.puts("")
  file.close

  # README.MD
  file = File.open("./#{get_input_dir}/README.md", "a")
  file.puts("Description de l'application:")
  file.close


  # CONFIG.RU 
  file = File.open("./#{get_input_dir}/config.ru", "w")
  file.puts("require 'bundler'")
  file.puts("Bundler.require")
  file.puts("")
  file.puts("")
  file.puts("require_relative './lib/controller.rb'")
  file.puts("")
  file.puts("########################################")
  file.puts("")
  file.puts("run Controller")
  file.puts("")
  file.close
end

####### BUNDLE INSTALL
def bundle_install
  Dir.chdir("./#{get_input_dir}/"){%x[#{"bundle install"}]}
  #system("bundle install")
end

####### RSPEC INITIALISATION
def rspec_init
  Dir.chdir("./#{get_input_dir}/"){%x[#{"rspec --init"}]}
  #system("rspec --init")
end

####### NOUVEAUX FICHIERS POUR L'APPLICATION

def new_app_file


  ####### app.rb
  file = File.open("./#{get_input_dir}/app.rb", "w")
  file.puts("require 'bundler'")
  file.puts("Bundler.require")
  file.puts("")
  file.puts("require_relative './lib/router.rb'")
  file.puts("")
  file.puts("########################################")
  file.puts("########################################")
  file.puts("####### CLASSE")
  file.puts("class App")
  file.puts("")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" def initialize()")
  file.puts("   Router.new.perform")
  file.puts(" end")
  file.puts("")
  file.puts("########################################")
  file.puts("end")
  file.puts("")
  file.puts("")
  file.close


  ####### router.rb
  file = File.open("./#{get_input_dir}/lib/router.rb", "w")
  file.puts("require 'bundler'")
  file.puts("Bundler.require")
  file.puts("")
  file.puts("require_relative './controller.rb'")
  file.puts("")
  file.puts("########################################")
  file.puts("########################################")
  file.puts("####### CLASSE")
  file.puts("class Router")
  file.puts("")
  file.puts(" attr_accessor :controller")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" def initialize()")
  file.puts("   @controller = Controller.new")
  file.puts(" end")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" ####### PERFORM")
  file.puts(" def perform")
  file.puts("   puts 'BIENVENUE - MENU'")
  file.puts("   @controller.fonction")
  file.puts(" end")
  file.puts("")
  file.puts("########################################")
  file.puts("end")
  file.puts("")
  file.puts("")
  file.close

  ####### controller.rb
  file = File.open("./#{get_input_dir}/lib/controller.rb", "w")
  file.puts("require 'bundler'")
  file.puts("Bundler.require")
  file.puts("")
  file.puts("require_relative './views/view.rb'")
  file.puts("require_relative './model.rb'")
  file.puts("")
  file.puts("########################################")
  file.puts("########################################")
  file.puts("####### CLASSE")
  file.puts("class Controller")
  file.puts("")
  file.puts(" #attr_accessor :var, :var2")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" def initialize()")
  file.puts("   ")
  file.puts(" end")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" ####### FONCTION")
  file.puts(" def fonction")
  file.puts("   Model.new")
  file.puts("   View.new")
  file.puts(" end")
  file.puts("")
  file.puts("########################################")
  file.puts("end")
  file.puts("")
  file.puts("")
  file.close

  
  ####### model.rb
  file = File.open("./#{get_input_dir}/lib/model.rb", "w")
  file.puts("require 'bundler'")
  file.puts("Bundler.require")
  file.puts("")
  file.puts("require_relative './views/view.rb'")
  file.puts("require_relative './controller.rb'")
  file.puts("")
  file.puts("########################################")
  file.puts("########################################")
  file.puts("####### CLASSE")
  file.puts("class Model")
  file.puts("")
  file.puts(" #attr_accessor :var, :var2")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" def initialize()")
  file.puts(" end")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" ####### PERFORM")
  file.puts(" def perform")
  file.puts("")
  file.puts(" end")
  file.puts("")
  file.puts("########################################")
  file.puts("end")
  file.puts("")
  file.puts("")
  file.close


  ####### view.rb
  file = File.open("./#{get_input_dir}/lib/views/view.rb", "w")
  file.puts("require 'bundler'")
  file.puts("Bundler.require")
  file.puts("")
  file.puts("require_relative '../model.rb'")
  file.puts("require_relative '../controller.rb'")
  file.puts("")
  file.puts("########################################")
  file.puts("########################################")
  file.puts("####### CLASSE")
  file.puts("class View")
  file.puts("")
  file.puts(" #attr_accessor :var, :var2")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" def initialize()")
  file.puts(" end")
  file.puts("")
  file.puts(" ########################################")
  file.puts(" ####### PERFORM")
  file.puts(" def perform")
  file.puts("")
  file.puts(" end")
  file.puts("")
  file.puts("########################################")
  file.puts("end")
  file.puts("")
  file.puts("")
  file.close

  
  
end

####### PERFORM
def perform
  check_input
  new_dir
  if ARGV[1].empty?
  else
  git_init
  end
  new_dir_files
  bundle_install
  rspec_init
  new_app_file
end

perform
