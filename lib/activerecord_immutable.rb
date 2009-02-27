module ActiveRecordImmutable

  def self.included(base)
    base.__send__(:define_method, :readonly?) do
      true
    end
  end 
end