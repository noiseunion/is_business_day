
module IsBusinessDay
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates an initializer file that can be used to specify business day rules"

      def self.source_root
        @_ibd_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def create_initializer_file
        template "is_business_day.rb", File.join('config/initializers', "is_business_day.rb")
      end
    end
  end
end