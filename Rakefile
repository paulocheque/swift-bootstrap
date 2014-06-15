APP = "MyApp"
VERSION = "1.0.0"

VERBOSE = true

# name and build location
MAIN_PATH = File.dirname(__FILE__)

BINARY_NAME = APP

PATH_SDK = File.join(MAIN_PATH, APP)
SCHEME_SDK = APP
SAMPLEAPP = "#{APP}Sample"
PROJECT_SDK = File.join(PATH_SDK, "#{APP}.xcodeproj")
WORKSPACE = "#{APP}.xcworkspace"

CONFIGURATION = "Release"

SDK_X86 = "iphonesimulator7.1"
SDK_ARM = "iphoneos7.1"
ARCH_X86 = "i386"
ARCH_ARM = "armv7s"
# ARCH_ARM = "armv7 armv7s"

TMP_PATH = File.join(MAIN_PATH, "tmp-build")
TMP_PATH_X86 = File.join(TMP_PATH, "build-simulator")
TMP_PATH_ARM = File.join(TMP_PATH, "build-device")


def colorize(text, color)
  color_codes = {
    :black    => 30,
    :red      => 31,
    :green    => 32,
    :yellow   => 33,
    :blue     => 34,
    :magenta  => 35,
    :cyan     => 36,
    :white    => 37
  }

  code = color_codes[color]

  if code == nil
    text
  else
    "\033[#{code}m#{text}\033[0m"
  end
end

def log_message(message)
  puts
  puts colorize("    #{message}", :blue)
  puts
end

def xcode_project_build(project, scheme, configuration, arch, sdk, output_path)
  compile_string = "xcodebuild -project '#{project}' -scheme '#{scheme}' -configuration '#{configuration}' -arch '#{arch}' -sdk '#{sdk}' clean build TARGET_BUILD_DIR=#{output_path} BUILT_PRODUCTS_DIR=#{output_path}"

    if VERBOSE != true then
     compile_string.insert(-1, " | grep -E -i 'failed|succeeded|warning|error'")
    end

  sh compile_string
end

def xcode_workspace_build(workspace, scheme, configuration, arch, sdk, output_path)
  compile_string = "xcodebuild -workspace '#{workspace}' -scheme '#{scheme}' -configuration '#{configuration}' -arch '#{arch}' -sdk '#{sdk}' clean build TARGET_BUILD_DIR=#{output_path} BUILT_PRODUCTS_DIR=#{output_path}"

    if VERBOSE != true then
     compile_string.insert(-1, " | grep -E -i 'failed|succeeded|warning|error'")
    end

  sh compile_string
end

# RAKE TASKS

task :refact do
  log_message("Refactoring project")
  sh "git remote rm origin"
  sh "git remote add origin #{repo}"
  sh "grep -rl 'MyApp' ./ | xargs sed -i 's/MyApp/#{NEW_APP_NAME}/g'"
  sh "grep -rl 'com.cheque' ./ | xargs sed -i 's/com.cheque/#{NEW_DOMAIN}/g'"
end

task :set_verbose do
    VERBOSE = true
end

task :config => [] do
  sh "xcode-select --print-path"
  sh "xcode-select --version"
  sh "python --version"
  sh "ruby --version"
end

desc "Remove temporary files"
task :clean do
    log_message("Cleaning temporary files")
    sh "rm -rf #{TMP_PATH}"
    sh "rm -rf #{PACK_FILE}"
end

task :check do
    sh "grep -Ir MyApp ."
    sh "grep -Ir com.cheque ."
end

task :install => [:config] do
  sh "gem install cocoapods"
end

task :deps => [] do
  sh "pod install"
end

task :open => [] do
  sh "open #{APP}.xcworkspace"
end

task :podcreate => [] do
  sh "pod spec create #{APP}"
  sh "edit #{APP}.podspec"
  sh "pod spec lint #{APP}.podspec"
end

desc "Build for simulator"
task :build_for_simulator do
  log_message("Building for simulator - #{ARCH_X86}")
  xcode_workspace_build(WORKSPACE, SCHEME_SDK, CONFIGURATION, ARCH_X86, SDK_X86, TMP_PATH_X86)
  # xcode_project_build(PROJECT_SDK, SCHEME_SDK, CONFIGURATION, ARCH_X86, SDK_X86, TMP_PATH_X86)
end

desc "Build for devices armv7 and newer"
task :build_for_device do
  log_message("Building for arm - #{ARCH_ARM}")
  xcode_workspace_build(WORKSPACE, SCHEME_SDK, CONFIGURATION, ARCH_ARM, SDK_ARM, TMP_PATH_ARM)
  # xcode_project_build(PROJECT_SDK, SCHEME_SDK, CONFIGURATION, ARCH_ARM, SDK_ARM, TMP_PATH_ARM)
end

task :default => [:build_for_simulator, :build_for_device]

task :verbose => [:set_verbose, :default]


namespace :itunes do
  task :upload => [] do
  end
end

# brew install imagemagick
# http://www.imagemagick.org/Usage/resize/#resize
task :logos do
  # Square
  Dir.chdir("static/img") do
    LOGO_SQUARE = "logo-1024x1024.png"
    sh "convert #{LOGO_SQUARE} -resize 512x512\! logo-512x512.png" # FB logo
    sh "convert #{LOGO_SQUARE} -resize 180x180\! logo-180x180.png" # FB logo
    sh "convert #{LOGO_SQUARE} -resize 144x144\! logo-144x144.png"
    sh "convert #{LOGO_SQUARE} -resize 114x114\! logo-114x114.png"
    sh "convert #{LOGO_SQUARE} -resize 72x72\! logo-72x72.png"
    sh "convert #{LOGO_SQUARE} -resize 57x57\! logo-57x57.png"
    sh "convert #{LOGO_SQUARE} -resize 32x32\! logo-32x32.png" # favicon
    sh "convert #{LOGO_SQUARE} -resize 16x16\! logo-16x16.png" # favicon and FB app small logo
    # Mobile Portrait
    LOGO_PORTRAIT = "logo-1024x1024.png"
    sh "convert #{LOGO_PORTRAIT} -resize 1536x2008\! logo-1536x2008.png"
    sh "convert #{LOGO_PORTRAIT} -resize 640x1136\! logo-640x1136.png"
    sh "convert #{LOGO_PORTRAIT} -resize 768x1004\! logo-768x1004.png"
    sh "convert #{LOGO_PORTRAIT} -resize 640x960\! logo-640x960.png"
    sh "convert #{LOGO_PORTRAIT} -resize 320x480\! logo-320x480.png"
    # Mobile Landscape
    LOGO_LANDSCAPE = "logo-1024x1024.png"
    sh "convert #{LOGO_LANDSCAPE} -resize 2048x1496\! logo-2048x1496.png"
    sh "convert #{LOGO_LANDSCAPE} -resize 1024x748\! logo-1024x748.png"
    # Banners
    LOGO_BANNER = "logo-1024x1024.png"
    sh "convert #{LOGO_BANNER} -resize 800x150\! logo-800x150.png" # FB app cover image
    sh "convert #{LOGO_BANNER} -resize 400x150\! logo-400x150.png" # FB cover image
    sh "convert #{LOGO_BANNER} -resize 155x100\! logo-155x100.png" # FB app web banner
    sh "convert #{LOGO_BANNER} -resize 200x60\! logo-200x60.png" # Site logo
    sh "convert #{LOGO_BANNER} -resize 150x50\! logo-150x55.png" # PagSeguro logo
    sh "convert #{LOGO_BANNER} -resize 150x50\! logo-150x50.png" # Site logo
    sh "convert #{LOGO_BANNER} -resize 140x40\! logo-140x40.png" # Site logo
  end
end
