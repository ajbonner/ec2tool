module EC2Tool

  class EC2Tool
    def initialize(config)
      @config = config
      @ec2 = ::AWS::EC2.new(
        :access_key_id     => config.access_key,
        :secret_access_key => config.secret)
    end

    def start_instance(instance_alias)
      config   = instance_config(instance_alias)
      instance = instance(config)
      instance.start
      sleep 1 until instance.status != :pending
      raise Exception.new("Cannot start instance") unless instance.status == :running

      if config.elastic_ip != nil 
        associate_elastic_ip(instance, config.elastic_ip)
      end

      "Launched instance #{instance.id}, status: #{instance.status}"
    end

    def stop_instance(instance_alias)
      config   = instance_config(instance_alias)
      instance = instance(config)
      instance.stop
      sleep 1 until instance.status != :stopping
      raise Exception.new("Cannot stop instance") unless instance.status == :stopped

      "Stopped instance #{instance.id}, status: #{instance.status}"
    end

    def status(instance_alias)
      config   = instance_config(instance_alias)
      instance = instance(config)

      instance.status
    end

    protected 

    def instance(config)
      instance_id = config.instance_id
      instance    = @ec2.instances[instance_id]
      raise Exception.new("Instance with #{instance_id} does not exist") unless instance.exists?
      instance
    end

    def associate_elastic_ip(instance, elastic_ip)
      instance.associate_elastic_ip(elastic_ip)
    end

    def instance_config(for_instance_alias)
      instance_config = @config.instance(for_instance_alias)
      raise Exception.new("Cannot find instance with alias #{for_instance_alias}") unless instance_config != nil
      instance_config
    end
  end

end
