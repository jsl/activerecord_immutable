require 'rubygems'
require 'activerecord'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :dbfile => ":memory:"
)

ActiveRecord::Base.connection.instance_variable_set(:@config, {})

require File.join(File.dirname(__FILE__), %w[.. init])

ActiveRecord::Migration.verbose = false

ActiveRecord::Base.silence do
  ActiveRecord::Schema.define do
    create_table :tacos do |table|
      table.string :salsa
    end
  end
end

class Taco < ActiveRecord::Base ; end

describe ActiveRecordImmutable do
  
  describe "when database is marked as immutable" do
    before do
      ActiveRecord::Base.connection.instance_variable_set(:@config, {:immutable => true})
      ActiveRecord::Base.send(:include, ActiveRecordImmutable)
      @beeftaco = Taco.new
    end
    
    it "should raise an error when record is written to" do
      lambda {
        @beeftaco.salsa = "juicy"
        @beeftaco.save!      
      }.should raise_error(ActiveRecord::ReadOnlyRecord)
    end
    
    it "should be readonly" do
      @beeftaco.should be_readonly
    end    
  end
  
  describe "when database is not marked as immutable" do
    before do
      ActiveRecord::Base.connection.instance_variable_set(:@config, {:immutable => false})
      ActiveRecord::Base.send(:include, ActiveRecordImmutable)
      @chickentaco = Taco.new
    end
    
    it "should not raise an error when record is written to" do    
      @chickentaco.salsa = "juicy"
      lambda {
        @chickentaco.save
      }.should_not raise_error
    end
    
    it "should not be readonly" do
      @chickentaco.should_not be_readonly
    end    
  end
end
