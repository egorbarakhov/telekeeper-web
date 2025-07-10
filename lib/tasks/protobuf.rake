# frozen_string_literal: true

namespace :protobuf do
  desc "Compile protobuf files to Ruby"
  task :compile do
    proto_dir = "proto"
    out_dir = "lib/protobuf"

    Dir.glob("#{proto_dir}/**/*.proto").each do |proto_file|
      puts "Compiling #{proto_file}..."

      cmd = [
        "bundle", "exec", "grpc_tools_ruby_protoc",
        "--ruby_out=#{out_dir}",
        "--grpc_out=#{out_dir}",
        "-I", proto_dir,
        proto_file
      ]

      _stdout_str, stderr_str, status = Open3.capture3(*cmd)
      unless status.success?
        puts stderr_str
        abort("Failed to compile #{proto_file}")
      end
    end
  end

  desc "Check that committed _pb.rb files are up to date with .proto definitions"
  task :check do
    proto_dir = "proto"
    tmp_out = "tmp/protobuf_check"

    FileUtils.rm_rf(tmp_out)
    FileUtils.mkdir_p(tmp_out)

    puts "Compiling to temporary directory for diff check..."

    Dir.glob("#{proto_dir}/**/*.proto").each do |proto_file|
      puts "Checking #{proto_file}..."
      system(
        "bundle", "exec", "grpc_tools_ruby_protoc",
        "--ruby_out=#{tmp_out}",
        "--grpc_out=#{tmp_out}",
        "-I", proto_dir,
        proto_file
      ) or abort("Failed to compile #{proto_file}")
    end

    # Copy relevant generated files to lib/ for comparison
    Dir.chdir(tmp_out) do
      diff_files = Dir.glob("**/*_pb.rb") + Dir.glob("**/*_services_pb.rb")
      diff_files.each do |file|
        full_path = File.join(Dir.pwd, file)
        target_path = File.join(Rails.root, "lib/protobuf", file)
        if File.exist?(target_path)
          puts "Comparing #{file}..."
          system("diff", "-u", target_path, full_path) || abort("❌ #{file} is out of date. Run `rake protobuf:compile`.")
        else
          abort("❌ #{file} is missing. Run `rake protobuf:compile`.")
        end
      end
    end

    puts "✅ All protobuf files are up to date."
  end
end
