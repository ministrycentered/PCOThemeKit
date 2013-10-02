
Dir["#{File.dirname(__FILE__)}/scripts/*.rb"].each {|file| require file.gsub('.rb', '') }

namespace :theme do 

  desc 'Create a new theme'
  task :create, :name do |t, args|
    theme_name = args[:name]
    path = Dir.pwd

    if PCOThemeKit::Theme.theme_exists?(theme_name, path)
      puts "Theme already exists.  Override (n/Y)"
      option = STDIN.gets.chomp.strip
      if option != "Y"
        next
      end
    end
    
    PCOThemeKit::Theme.new_theme(theme_name, path)
  end

end