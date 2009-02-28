ActiveRecord Immutable
======================

Makes all AR-backed models read-only.  Any attempts to write to AR-backed classes will raise a ActiveRecord::ReadOnlyRecord exception.

Usage
-----

Install with:

./script/plugin install git://github.com/jsl/activerecordimmutable.git 

from your RAILS_ROOT.

Uninstall the plugin to disable.