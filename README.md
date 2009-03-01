ActiveRecord Immutable
======================

Makes all AR-backed models read-only.  Any attempts to write to
AR-backed classes will raise a ActiveRecord::ReadOnlyRecord exception.

Useful for temporarily making a site running Ruby on Rails read-only
for database maintenance.

You may want to create a custom 500.html page that describes why the
site is in read-only mode, and when you anticipate that it'll be back
online.

Usage
-----

Install with:

./script/plugin install git://github.com/jsl/activerecord_immutable.git 

from your RAILS_ROOT.  Restart your app and all models are marked as
read-only.

Remove the plugin, restart your Rails app, and your site becomes
read-write again.

Author
------

Justin S. Leitgeb, justin AT phq DOT org