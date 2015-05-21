#######################################################
# Below module defined to read test.rb data from yaml file
#######################################################

module TestData


  puts "Loaded Test Data from test_data Yaml file.. !"

  @hash=""
  def load_data()
    scenario_found=false
    #File.dirname(File.dirname(File.dirname(File.expand_path(__FILE__)))) + '/global/data/wallet_data.yaml'
    file_name=File.open(File.expand_path('../../../global/data/test_data.yaml',__FILE__),'r')

    config = YAML.load_file(file_name)
    config.each {|key,value|
      # puts "value #{value} : #{key}"
      if key.eql? @scenario_name or scenario_found==true
        scenario_found=true
        if not value.nil?
          @hash=config[key]
          file_name.close
          return
        end

      end
    }

    if scenario_found==false
      @hash= config["Default"]
      file_name.close
    end

  end

  def data(hash_key)
    #puts hash_key
    if @hash[hash_key.to_sym].nil?
      raise "parameter (#{hash_key}) does not exist in yaml file"
    else
      return @hash[hash_key.to_sym]
    end
  end

  def get_data(value)
    # puts File.expand_path('./') + '/global/data'
    DataMagic.yml_directory = File.expand_path('./') + '/global/data'
    # DataMagic.yml_directory = '/Users/pbb212/WorkDir/android-wallet-automation/global/data'
    DataMagic.load 'test_data.yaml'
    # puts value
    value = value.split("~")
    @data = data_for value[0]
    @data[value[1]]
  end

end