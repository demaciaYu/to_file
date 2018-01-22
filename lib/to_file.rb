require "to_file/version"

module ToFile
  class To
    def Self.yml(target_object, export_path = './example.yml', confirmation = true)
      if confirmation && File.exist?(export_path)
        puts 'Export canceled!'; exit unless confirm?(export_path)
      end
      
      File.open(export_path, 'w') { |f| f.write to_yml(target_object)}

      puts "\e[32m successfully exported to " + export_path + "\e[0m"
    end

    def to_yml(target_object)
      begin
        target_object.to_yaml
      rescue
        raise ArgumentError,
          'target_object can not be transformed to yaml format!'
      end
    end

    def confirm?(export_path)
      msg =  "\033[31mWARNING '" + export_path + "' is already existing, do you"
      msg += " want to overwrite it ??? please press 'y' or 'n' to confirm!( "
      msg += "tip: confirm can be turned off by parameter): \033[0m"
      puts msg

      prompt = STDIN.gets.chomp
      
      until %w(y n).include? prompt.downcase do
        puts "\033[31mInvalid input, please input 'y' or 'n'\033[0m"
        prompt = STDIN.gets.chomp
      end

      prompt.downcase == 'y' ? true : false
    end
  end
end
