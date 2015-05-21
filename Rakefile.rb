#########################################################################################################################################
# rake executes all scenario in batch based on tags specified

# Rake usage:
# rake run[tag_name,profile_name,/Application/android.apk] => Executes scenario with specified tag on given app
# rake run[tag_name|tag_name,profile_name,/Application/android.apk] => Executes scenario with multiple tags on given app in OR logic
# rake run[tag_name&tag_name,profile_name,/Application/android.apk] => Executes scenario with multiple tags on given app in AND logic
########################################################################################################################################
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'yard'
require 'zip'

desc "Run all features with custom tags defined"
task :run, [:tag, :profile, :app_path] do |t, args|

  tag = args[:tag]
  profile = args[:profile]
  app_path = args[:app_path]

  ENV['APP_PATH'] = app_path

  # Method to create images subfolder
  create_results_sub_folder


  # Method to start report server
  start_cucumber_sandwich_report_server

  @tag = ""
  if tag.include? "_"
    # Multi tag support (OR Logic)
    custom_tag = tag.split('_')
    custom_tag.each do |custom_tag|
      @tag += "@#{custom_tag},"
    end
    @tag = "--tag " + @tag
  elsif  tag.include? "-"
    # Multi tag support (AND Logic)
    custom_tag = tag.split('-')
    custom_tag.each do |custom_tag|
      @tag += "--tag @#{custom_tag} "
    end
  else
    #Single tag support
    @tag += "--tag @#{tag} "
  end
  @tag = @tag.chop

  # Method call to zip regular results
  zip_reports("regular")

  Cucumber::Rake::Task.new(:run) do |t|
    t.cucumber_opts = "#{@tag} --tags ~@not_ready -x --format pretty -f json -o cucumber.json -f rerun --out rerun.txt"
    t.profile = profile
  end

end

##############################################################################################################################
# Method defined to start cucumber-sandwich report server in separate terminal to monitor json files to generate html reports
##############################################################################################################################

def start_cucumber_sandwich_report_server

  project_dir = File.expand_path('')
  server_dir = project_dir + "/global/support-libraries/cucumber-sandwich.jar"
  report_dir = project_dir + "/Results/"

  files = Dir.new(project_dir)
  files.each { |f|
    if f =='cucumber.json'
      File.delete("cucumber.json")
    end
  }

  pid = spawn("java -jar #{server_dir} -f #{project_dir} -o #{report_dir}", :out => "Results/test.out", :err => "Results/test.err")
  Process.detach(pid)
  puts pid

end

#########################################
# To generate Cucumber BDD Documentation
#########################################

desc "Yard commands 1 mkdir ~/.yard 2 yard config load_plugins true 3 rake yard"

YARD::Rake::YardocTask.new(:yard) do |t|
  t.files = ['features/**/*.feature', 'features/**/*.rb', 'global/**/*.rb']
end

##############################################################################
# Cucumber rake task defined to rerun the failed scenarios marked in txt file
##############################################################################

desc "To rerun all failed scenario's"

task :rerun, [:profile, :app_path] do |t, args|

  # Method call to zip regular results
  zip_reports("regular")

  profile = args[:profile]
  app_path = args[:app_path]

  ENV['APP_PATH'] = app_path

  Cucumber::Rake::Task.new(:rerun) do |t|
    t.cucumber_opts = "@rerun.txt --tags ~@not_ready -x --format pretty -f json -o cucumber.json"
    t.profile = profile
  end
end

#######################################################################################
# Defined below method to create subfolder inside results folders for image comparison
#######################################################################################

def create_results_sub_folder
  root_dir = File.expand_path('')
  results_dir = root_dir + "/Results/"
  ss_dir = root_dir + "/Results/Screenshots/"
  # img_dir = root_dir + "/Results/Images/"
  # ei_dir = root_dir + "/Results/Images/ExpectedImages/"
  # ai_dir = root_dir + "/Results/Images/ActualImages/"
  # cr_dir = root_dir + "/Results/Images/ComaparisonResults/"
  Dir.mkdir(results_dir) unless Dir.exists?(results_dir)
  Dir.mkdir(ss_dir) unless Dir.exists?(ss_dir)
  # Dir.mkdir(img_dir) unless Dir.exists?(img_dir)
  # Dir.mkdir(ei_dir) unless Dir.exists?(ei_dir)
  # Dir.mkdir(ai_dir) unless Dir.exists?(ai_dir)
  # Dir.mkdir(cr_dir) unless Dir.exists?(cr_dir)
end

###############################################################################
# Method defined to zip cucumber regular exdcution results before failed rerun
###############################################################################
def zip_reports(execution_mode)
  base_dir = Dir.pwd
  directory = base_dir + "/Results/cucumber-html-reports/"
  zipfile_name = base_dir + "/Results/cucumber-html-reports-#{execution_mode}_#{Time.now.strftime("%d_%m_%y_%H_%M_%S")}.zip"

  Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
    Dir[File.join(directory, '**', '**')].each do |file|
      zipfile.add(file.sub(directory, ''), file)
    end
  end

end