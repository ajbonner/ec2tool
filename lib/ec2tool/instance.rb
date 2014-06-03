module EC2Tool

  class Instance 
    attr_accessor :instance_alias, :instance_id, :elastic_ip

    def initialize(instance_alias, instance_id)
      self.instance_alias = instance_alias
      self.instance_id    = instance_id
    end
  end

end
