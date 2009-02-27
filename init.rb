require File.expand_path(File.join(File.dirname(__FILE__), %w[lib activerecord_immutable]))

ActiveRecord::Base.send(:include, ActiveRecordImmutable)
