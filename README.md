ActiveRecord Immutable
======================

Makes all AR-backed models read-only.  Any attempts to write to
AR-backed classes will raise a ActiveRecord::ReadOnlyRecord exception.

Usage
-----

Install with:

./script/plugin install git://github.com/jsl/activerecord_immutable.git 

from your RAILS_ROOT.

Remove the plugin, restart your Rails app, and your site becomes
read-write again.

Author
------

Justin S. Leitgeb <justin AT phq DOT org>