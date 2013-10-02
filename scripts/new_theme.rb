require 'plist'

module PCOThemeKit
  class Theme

    def self.new_theme(name, path)
      puts "Saving theme to #{file_path(path, name)}"
      File.open(file_path(path, name), 'w') {|f| f.write(plist_data(name)) }
    end

    def self.theme_exists?(name, path)
      File.exists? file_path(path, name)
    end

    private
      def self.file_name(theme_name)
        theme_name.gsub(/[^\w]/i, '')
      end

      def self.file_path(path, theme_name)
        "#{path}/#{file_name(theme_name)}.plist"
      end

      def self.plist_data(theme_name)
        {
          name: file_name(theme_name),
          displayName: theme_name,
          colors: {
            backgroundColor: "255,255,255",
          },
          images: {}
        }.to_plist
      end

  end
end