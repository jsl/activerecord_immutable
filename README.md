ActiveRecord Immutable
======================

Makes all AR-backed models read-only, or globally turn the readonly option off.

Usage
-----

Install in your plugins dir.  Set the option immutable: true in your database.yml to
make all classes in your project readonly, or immutable: false to make all classes 
not be read-only.  Removing the immutable line from the database.yml will effectively 
disable this plugin.

Quirks, and possibly unexpected behavior
----------------------------------------

This plugin overrides the readonly? method on ActiveRecord-backed classes whenever
"immutable" is defined in your database.yaml.  That means that classes will never be
read-only when immutable is set to false, and always be read-only when immutable is
true.