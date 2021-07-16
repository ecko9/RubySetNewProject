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
  file.puts("gem 'launchy'")
 
  file.close

  # .ENV
  file = File.open("./#{get_input_dir}/.env", "w")
  file.puts(".env")
  file.close

  # README.MD
  file = File.open("./#{get_input_dir}/README.md", "w")
  file.puts("Description de l'application:")
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
####### Exemple_app.rb
def new_app_file
  file = File.open("./#{get_input_dir}/lib/Exemple_app.rb", "w")
  file.puts("require 'rspec'")
  file.puts("require 'pry'")
  file.puts("require 'nokogiri'")
  file.puts("require 'open-uri'")
  file.puts("require 'watir'")
  file.puts("require 'dotenv'")
  file.puts("require 'twitter'")
  file.puts("require 'rubocop'")
  file.puts("require 'launchy'")
  file.puts("")
  file.puts("")
  file.puts("####### FONCTION")
  file.puts("def fonction")
  file.puts("")
  file.puts("end")
  file.puts("")
  file.puts("")
  file.puts("####### PERFORM")
  file.puts("def perform")
  file.puts("")
  file.puts("end")
  file.puts("")
  file.puts("perform")
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