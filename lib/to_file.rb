require 'to_file/version'
require 'yaml'
require 'json'
require 'active_support'
require 'active_support/core_ext'

module ToFile
  class To
    class << self
      # type hash should be {input_file_type: export_file_suffix}
      type_hash = {
        yml:  "yml",
        yaml: "yml",
        json: "json",
        xml:  "xml"
      }

      type_hash.each do |key, value| 
        define_method :"#{key}" do |target_object, export_path = "./example.#{value}", force_overwrite = false|
          if !force_overwrite && File.exist?(export_path)
            puts 'Export canceled!'; exit unless overwrite_confirm?(export_path)
          end

          File.open(export_path, 'w') { |f| f.write send("to_#{value}", target_object)}

          puts "\e[32m successfully exported to ---> " + File.expand_path(export_path) + "\e[0m"
        end
      end

      private

      def to_yml(target_object)
        begin
          target_object.to_yaml
        rescue => e
          raise ArgumentError, error_msg("yaml", e.message)
        end
      end

      def to_json(target_object)
        begin
          JSON.pretty_generate target_object
        rescue => e
          raise ArgumentError, error_msg("json", e.message)
        end
      end

      def to_xml(target_object)
        begin
          target_object.to_xml
        rescue => e
          raise ArgumentError, error_msg("xml", e.message)
        end
      end

      def error_msg(data_type, err)
        'target_object can not be transformed to ' +
          data_type.to_s +
          ' format! The error msg is: ' +
          err.to_s
      end

      def overwrite_confirm?(export_path)
        msg =  "\033[31mWARNING '" + export_path + "' is already existing, do you"
        msg += " want to overwrite it ??? please press 'y' or 'n' to confirm!( "
        msg += "tip: overwrite feature can be turned off manually by parameter): \033[0m"
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
end
