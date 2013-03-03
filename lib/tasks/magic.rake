require_relative '../../app/lib/magic_requires'

namespace :magic do
    desc "Convert ERB to backbone template"
    task :convert, [:erb_path, :output_path] => [:environment] do |t, args|
        erb_path          = args[:erb_path]
        intermediate_path = "app/temp"
        output_path       = args[:output_path]

        erb = File.read(erb_path)
        erb_buffer = StringIO.new
        erb_buffer << erb

        output_buffer = StringIO.new

        helper_tags = Rails.application.routes.url_helpers.methods - Object.methods

        ErbToBackboneConverter.new(erb_buffer, intermediate_path, output_buffer, :helper_tags => helper_tags, :locals => { :review => Review.create! }).convert

        output_path = Pathname.new(output_path)
        FileUtils.mkdir_p(output_path.dirname) unless File.exists?(output_path.dirname)
        File.open(output_path, "w") { |f| f.write output_buffer.string }
    end
end
