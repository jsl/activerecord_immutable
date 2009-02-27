require 'rubygems'
require 'activerecord'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :dbfile => ":memory:"
)

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
  before do
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
