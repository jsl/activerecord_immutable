module ActiveRecordImmutable

  def self.included(base)
    if ActiveRecord::Base.connection.instance_variable_get(:@config)[:immutable] == true
      base.__send__(:define_method, :readonly?) do
        ActiveRecord::Base.connection.instance_variable_get(:@config)[:immutable] == true
      end
    end
  end 
end