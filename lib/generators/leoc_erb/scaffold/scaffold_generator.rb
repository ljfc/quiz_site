require 'rails/generators/erb'
require 'rails/generators/resource_helpers'

module LeocErb
  module Generators
    class ScaffoldGenerator < Erb::Generators::Base
      include Rails::Generators::ResourceHelpers

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      def create_root_folder
        empty_directory File.join("app/views", controller_file_path)
      end

      def copy_view_files
        # Genericly named views.
        available_views.each do |filename|
          template filename, File.join("app/views", controller_file_path, filename)
        end
        # Views which needs names generating.
        template "_partial.html.erb", File.join("app/views", controller_file_path, "_#{file_name}.html.erb")
      end

    protected

      def available_views
        %W{
          index.html.erb
          index.js.erb
          edit.html.erb
          edit.js.erb
          update.js.erb
          show.html.erb
          show.js.erb
          new.html.erb
          new.js.erb
          create.js.erb
          destroy.js.erb
          _form.html.erb
        }
      end
    end
  end
end
