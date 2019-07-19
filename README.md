# Rails photo gallery

## Gem
	gem 'trestle'
	gem 'carrierwave', '~> 1.0'
	gem 'mini_magick', ">= 4.9.4"

## Command
* rails generate model Project title:text desc:text thumb:text feature:boolean published:boolean sorting:integer
* rails generate controller Projects
* rails generate trestle:resource Project
* rails g uploader Image

## 'app/models/project.rb'
	mount_uploader :image, ImageUploader

## Add Gallery
* rails generate model photo name:string sorting:integer project_id:integer
* rails g uploader Gallery


