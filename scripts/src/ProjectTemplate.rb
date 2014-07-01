require 'pathname'

class ProjectTemplate
    def initialize(root_path)
      @root = Pathname(root_path)
      @templates = Pathname(File.dirname(__FILE__)).parent.join("templates")

      @project_name = "TestProject"

      @folders = [ "src", "build", "bin", "lib", "include" ]
    end

    def cpp_template
      self.create_directories
      self.create_cmake
      self.create_cpp
      self.create_ycm
    end

# ----------------------------------------------------------------------
    protected
    def create_directories
      if not Dir.exist? @root
        Dir.mkdir(@root)
      end

      @folders.each do |f|
        dir = @root.join f
        if not Dir.exist? dir
          Dir.mkdir dir
        end
      end
    end

    def create_ycm
      ycm_file = @root.join(".ycm_extra_conf.py")
      if not File.exist? ycm_file
        ycm = IO.read(@templates.join("ycm_extra_conf.txt"))
        IO.write(ycm_file,ycm)
      end
    end

    def create_cmake
      cmake_root_file = @root.join("CMakeLists.txt")
      if not File.exist? cmake_root_file
        cmake_root = IO.read(@templates.join("cmake_root.txt"))
        cmake_root["{$1:project_name}"] = @project_name
        IO.write(cmake_root_file,cmake_root)
      end

      cmake_file = @root.join("src").join("CMakeLists.txt")
      if not File.exist? cmake_file
        cmake = IO.read(@templates.join("cmake.txt"))
        IO.write(cmake_file,cmake)
      end
    end

    def create_cpp
      cpp_file = @root.join("src").join("main.cpp")
      if not File.exist? cpp_file
        cpp = IO.read(@templates.join("cpp.txt"))
        IO.write(cpp_file,cpp)
      end
    end
end
