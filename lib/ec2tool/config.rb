module EC2Tool

  class Config
    CONFIG_FILE = 'config.yaml'
    attr_accessor :access_key, :secret, :instances

    def Config.installed?(install_dir)
      File.exists?(install_dir + '/' + CONFIG_FILE)
    end

    def Config.install(install_dir, dist_dir)
      dist_file   = dist_dir + '/' + CONFIG_FILE + '.dist'
      config_file = install_dir + '/' + CONFIG_FILE

      Dir.mkdir(install_dir) unless Dir.exists?(install_dir) 

      FileUtils.cp(dist_file, config_file) unless File.exists?(config_file)

      raise Exception.new(config_file + ' missing') unless File.exists?(config_file)
    end

    def Config.load_config(install_dir)
      File.open(install_dir + '/' + CONFIG_FILE)
    end

    def initialize(config_file)
      self.instances = {}
      raise Exception.new('#{config_file} is not installed!') \
          unless File.exists?(config_file)

      parse YAML.load(File.read(config_file))
    end

    def parse(config)
      raise Exception.new("API credentials not set") unless config.has_key?('access_key') && config.has_key?('secret')
      self.access_key = config['access_key']
      self.secret     = config['secret']

      raise Exception.new("No instances defined") unless config.has_key?('instances')

      config['instances'].each_pair do |instance_alias,details|
        raise Exception.new("Instance id required for #{instance_alias}") unless details.has_key?('instance_id')
        instance = Instance.new(instance_alias, details['instance_id'])
        if details.has_key?('elastic_ip')
          instance.elastic_ip = details['elastic_ip']
        end
        self.instances[instance_alias] = instance
      end
    end

    def instance(instance_alias)
      instances[instance_alias]
    end
  end

end
