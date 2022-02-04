#!/bin/bash

# Help info ===================================================================
general_help () {
	echo -e "Usage:"
	echo -e "  maglev new APP_PATH [options]"
	echo -e "Options:"
	echo -e "  [--skip-namespace]\t\t\t# Skip namespace (affects only isolated engines)"
	echo -e "  -d, [--database=DATABASE]\t\t# Preconfigure for selected database (options: sqlite3 (default), mysql, postgresql, mongodb)"
	echo -e "  [--api]\t\t\t\t# Preconfigure smaller stack for API only apps"
	echo -e "  [--minimal]\t\t\t\t# Preconfigure a minimal maglev app"
	echo -e "  -j, [--javascript=JAVASCRIPT]\t\t# Choose JavaScript approach [options: importmap (default), webpack, esbuild, rollup]"
	echo -e "  -l, [--lint=JAVASCRIPT]\t\t# Choose lint approach [options: eslint (default)]"
	echo -e "  -c, [--css=CSS]\t\t\t# Choose CSS processor [options: tailwind, bootstrap, bulma, postcss, sass...]"
	echo -e "  -B, [--skip-bundle]\t\t\t# Don't run npm install"
	echo -e ""
	echo -e "Runtime options:"
	echo -e "  -f, [--force]\t\t\t\t# Overwrite files that already exist"
	echo -e "  -q, [--quiet]\t\t\t\t# Suppress status output"
	echo -e "  -s, [--skip]\t\t\t\t# Skip files that already exist"
	echo -e ""
	echo -e "Maglev options:"
	echo -e "  -h, [--help]\t\t\t\t# Show this help message and quit"
	echo -e "  -v, [--version]\t\t\t# Show Maglev version number and quit"
	echo -e ""
	echo -e "Description:"
	echo -e "  The 'maglev new' command creates a new Maglev application with a default directory structure and configuration at the path you specify."
	echo -e "  You can specify extra command-line arguments to be used every time 'maglev new' runs in the .maglevrc configuration file in your home directory, or in $XDG_CONFIG_HOME/maglev/maglevrc if XDG_CONFIG_HOME is set."
	echo -e "  Note that the arguments specified in the .maglevrc file don't affect the defaults values shown above in this help message."
	echo -e "Example:"
	echo -e "  maglev new ~/code/weblog"
	echo -e "  This generates a skeletal Maglev installation in ~/code/weblog."
}

help_generate () {
	echo -e "Usage:\n\tmaglev generate|-g <generator> [options]\n"
	echo -e "Generators:\n\tContoller\n\tModel\n\tRoute\n\tScaffold"
}

help_controller () {
	echo -e "Usage:"
	echo -e "  maglev generate controller NAME [action action] [options]"
	echo -e ""
	echo -e "Options:"
	echo -e "  [--skip-namespace], [--no-skip-namespace]\t\t\t# Skip namespace (affects only isolated engines)"
	echo -e "  [--skip-collision-check], [--no-skip-collision-check]\t\t# Skip collision check"
	echo -e "  [--skip-routes], [--no-skip-routes]\t\t\t\t# Don't add routes to config/routes.rb."
	echo -e "  [--helper], [--no-helper]\t\t\t\t\t# Indicates when to generate helper"
	echo -e "\t\t\t\t\t\t\t\t# Default: true"
	echo -e "  -e, [--template-engine=NAME]\t\t\t\t\t# Template engine to be invoked"
	echo -e "\t\t\t\t\t\t\t\t# Default: ejs"
	echo -e "  -t, [--test-framework=NAME]\t\t\t\t\t# Test framework to be invoked"
	echo -e "\t\t\t\t\t\t\t\t# Default: test_unit"
	echo -e ""
	echo -e "Runtime options:"
	echo -e "  -f, [--force]\t\t\t\t\t\t\t# Overwrite files that already exist"
	echo -e "  -p, [--pretend], [--no-pretend]\t\t\t\t# Run but do not make any changes"
	echo -e "  -q, [--quiet], [--no-quiet]\t\t\t\t\t# Suppress status output"
	echo -e "  -s, [--skip], [--no-skip]\t\t\t\t\t# Skip files that already exist"
	echo -e ""
	echo -e "Description:"
	echo -e "  Generates a new controller and its views. Pass the controller name, either"
	echo -e "  CamelCased or under_scored, and a list of views as arguments."
	echo -e ""
	echo -e "  To create a controller within a module, specify the controller name as a"
	echo -e "  path like 'parent_module/controller_name'."
	echo -e ""
	echo -e "  This generates a controller class in app/controllers and invokes helper,"
	echo -e "  template engine, assets, and test framework generators."
	echo -e ""
	echo -e "Example:"
	echo -e "  maglev generate controller CreditCards open debit credit close"
	echo -e ""
	echo -e "  CreditCards controller with URLs like /credit_cards/debit."
	echo -e "  Controller: app/controllers/credit_cards_controller.rb"
	echo -e "  Test:       test/controllers/credit_cards_controller_test.rb"
	echo -e "  Views:      app/views/credit_cards/debit.html.erb [...]"
	echo -e "  Helper:     app/helpers/credit_cards_helper.rb"
}

help_model () {
	echo -e "Usage:"
	echo -e "  maglev generate model NAME [field[:type][:index] field[:type][:index]] [options]"
	echo -e ""
	echo -e "Options:"
	echo -e "  [--skip-namespace], [--no-skip-namespace]\t\t# Skip namespace (affects only isolated engines)"
	echo -e "  [--skip-collision-check], [--no-skip-collision-check]\t# Skip collision check"
	echo -e "  [--force-plural], [--no-force-plural]\t\t\t# Forces the use of the given model name"
	echo -e "  -o, --orm=NAME\t\t\t\t\t# ORM to be invoked"
	echo -e "\t\t\t\t\t\t\t# Default: active_record"
	echo -e ""
	echo -e "ActiveRecord options:"
	echo -e "  [--migration], [--no-migration]\t\t\t# Indicates when to generate migration"
	echo -e "\t\t\t\t\t\t\t# Default: true"
	echo -e "  [--timestamps], [--no-timestamps]\t\t\t# Indicates when to generate timestamps"
	echo -e "\t\t\t\t\t\t\t# Default: true"
	echo -e "  [--parent=PARENT]\t\t\t\t\t# The parent class for the generated model"
	echo -e "  [--indexes], [--no-indexes]\t\t\t\t# Add indexes for references and belongs_to columns"
	echo -e "\t\t\t\t\t\t\t# Default: true"
	echo -e "  [--primary-key-type=PRIMARY_KEY_TYPE]\t\t\t# The type for primary key"
	echo -e "  --db, [--database=DATABASE]\t\t\t\t# The database for your model's migration. By default, the current environment's primary database is used."
	echo -e "  -t, [--test-framework=NAME]\t\t\t\t# Test framework to be invoked"
	echo -e "\t\t\t\t\t\t\t# Default: test_unit"
	echo -e ""
	echo -e "TestUnit options:"
	echo -e "  [--fixture], [--no-fixture]\t\t\t\t# Indicates when to generate fixture"
	echo -e "\t\t\t\t\t\t\t# Default: true"
	echo -e "  -r, [--fixture-replacement=NAME]\t\t\t# Fixture replacement to be invoked"
	echo -e ""
	echo -e "Runtime options:"
	echo -e "  -f, [--force]\t\t\t\t\t\t# Overwrite files that already exist"
	echo -e "  -p, [--pretend], [--no-pretend]\t\t\t# Run but do not make any changes"
	echo -e "  -q, [--quiet], [--no-quiet]\t\t\t\t# Suppress status output"
	echo -e "  -s, [--skip], [--no-skip]\t\t\t\t# Skip files that already exist"
	echo -e ""
	echo -e "Description:"
	echo -e "  Generates a new model. Pass the model name, either CamelCased or"
	echo -e "  under_scored, and an optional list of attribute pairs as arguments."
	echo -e ""
	echo -e "  Attribute pairs are field:type arguments specifying the"
	echo -e "  model's attributes. Timestamps are added by default, so you don't have to"
	echo -e "  specify them by hand as 'created_at:datetime updated_at:datetime'."
	echo -e ""
	echo -e "  As a special case, specifying 'password:digest' will generate a"
	echo -e "  password_digest field of string type, and configure your generated model and"
	echo -e "  tests for use with Active Model has_secure_password (assuming the default ORM"
	echo -e "  and test framework are being used)."
	echo -e ""
	echo -e "  You don't have to think up every attribute up front, but it helps to"
	echo -e "  sketch out a few so you can start working with the model immediately."
	echo -e ""
	echo -e "  This generator invokes your configured ORM and test framework, which"
	echo -e "  defaults to Active Record and TestUnit."
	echo -e ""
	echo -e "  Finally, if --parent option is given, it's used as superclass of the"
	echo -e "  created model. This allows you create Single Table Inheritance models."
	echo -e ""
	echo -e "  If you pass a namespaced model name (e.g. admin/account or Admin::Account)"
	echo -e "  then the generator will create a module with a table_name_prefix method"
	echo -e "  to prefix the model's table name with the module name (e.g. admin_accounts)"
	echo -e ""
	echo -e "  Available field types:"
	echo -e ""
	echo -e "  Just after the field name you can specify a type like text or boolean."
	echo -e "  It will generate the column with the associated SQL type. For instance:"
	echo -e ""
	echo -e "    maglev generate model post title:string body:text"
	echo -e ""
	echo -e "  will generate a title column with a varchar type and a body column with a text"
	echo -e "  type. If no type is specified the string type will be used by default."
	echo -e "  You can use the following types:"
	echo -e ""
	echo -e "  integer"
	echo -e "  primary_key"
	echo -e "  decimal"
	echo -e "  float"
	echo -e "  boolean"
	echo -e "  binary"
	echo -e "  string"
	echo -e "  text"
	echo -e "  date"
	echo -e "  time"
	echo -e "  datetime"
	echo -e ""
	echo -e "  You can also consider references as a kind of type. For instance, if you run:"
	echo -e "  "
	echo -e "    maglev generate model photo title:string album:references"
	echo -e "  "
	echo -e "  It will generate an album_id column. You should generate these kinds of fields when"
	echo -e "  you will use a belongs_to association, for instance. references also supports"
	echo -e "  polymorphism, you can enable polymorphism like this:"
	echo -e "  "
	echo -e "    maglev generate model product supplier:references{polymorphic}"
	echo -e "  "
	echo -e "  For integer, string, text and binary fields, an integer in curly braces will"
	echo -e "  be set as the limit:"
	echo -e "  "
	echo -e "    maglev generate model user pseudo:string{30}"
	echo -e "  "
	echo -e "  For decimal, two integers separated by a comma in curly braces will be used"
	echo -e "  for precision and scale:"
	echo -e "  "
	echo -e "    maglev generate model product 'price:decimal{10,2}'"
	echo -e "  "
	echo -e "  You can add a :uniq or :index suffix for unique or standard indexes"
	echo -e "  respectively:"
	echo -e "  "
	echo -e "    maglev generate model user pseudo:string:uniq"
	echo -e "    maglev generate model user pseudo:string:index"
	echo -e "  "
	echo -e "  You can combine any single curly brace option with the index options:"
	echo -e "  "
	echo -e "    maglev generate model user username:string{30}:uniq"
	echo -e "    maglev generate model product supplier:references{polymorphic}:index"
	echo -e "  "
	echo -e "  If you require a password_digest string column for use with"
	echo -e "  has_secure_password, you can specify password:digest:"
	echo -e "  "
	echo -e "    maglev generate model user password:digest"
	echo -e "  "
	echo -e "  If you require a token string column for use with"
	echo -e "  has_secure_token, you can specify auth_token:token:"
	echo -e "  "
	echo -e "    maglev generate model user auth_token:token"
	echo -e "  "
	echo -e "  Examples:"
	echo -e "    maglev generate model account"
	echo -e "  "
	echo -e "  For Active Record and TestUnit it creates:"
	echo -e "  "
	echo -e "    Model:      app/models/account.rb"
	echo -e "    Test:       test/models/account_test.rb"
	echo -e "    Fixtures:   test/fixtures/accounts.yml"
	echo -e "    Migration:  db/migrate/XXX_create_accounts.rb"
	echo -e "  "
	echo -e "    maglev generate model post title:string body:text published:boolean"
	echo -e "  "
	echo -e "  Creates a Post model with a string title, text body, and published flag."
	echo -e "  "
	echo -e "    maglev generate model admin/account"
	echo -e "  "
	echo -e "  For Active Record and TestUnit it creates:"
	echo -e "  "
	echo -e "    Module:     app/models/admin.rb"
	echo -e "    Model:      app/models/admin/account.rb"
	echo -e "    Test:       test/models/admin/account_test.rb"
	echo -e "    Fixtures:   test/fixtures/admin/accounts.yml"
	echo -e "    Migration:  db/migrate/XXX_create_admin_accounts.rb"
}

help_route () {
	echo -e "Usage:\n\tmaglev generate|-g route [options]\n"
	echo -e "Options:\n\tContoller\n\tModel\n\tRoute\n\tScaffold"
}

help_scaffold () {
	echo -e "Usage:"
	echo -e "  maglev generate scaffold NAME [field[:type][:index] field[:type][:index]] [options]"
	echo -e ""
	echo -e "Options:"
	echo -e "  [--skip-namespace], [--no-skip-namespace]\t\t\t# Skip namespace (affects only isolated engines)"
	echo -e "  [--skip-collision-check], [--no-skip-collision-check]\t\t# Skip collision check"
	echo -e "  [--force-plural], [--no-force-plural]\t\t\t\t# Forces the use of the given model name"
	echo -e "  -o, --orm=NAME\t\t\t\t\t\t# ORM to be invoked"
	echo -e "\t\t\t\t\t\t\t\t# Default: active_record"
	echo -e "  [--model-name=MODEL_NAME]\t\t\t\t\t# ModelName to be used"
	echo -e "  [--resource-route], [--no-resource-route]\t\t\t# Indicates when to generate resource route"
	echo -e "\t\t\t\t\t\t\t\t# Default: true"
	echo -e "  [--api], [--no-api]\t\t\t\t\t\t# Indicates when to generate api"
	echo -e "  -c, --scaffold-controller=NAME\t\t\t\t# Scaffold controller to be invoked"
	echo -e "\t\t\t\t\t\t\t\t# Default: scaffold_controller"
	echo -e ""
	echo -e "ActiveRecord options:"
	echo -e "  [--migration], [--no-migration]\t\t\t\t# Indicates when to generate migration"
	echo -e "\t\t\t\t\t\t\t\t# Default: true"
	echo -e "  [--timestamps], [--no-timestamps]\t\t\t\t# Indicates when to generate timestamps"
	echo -e "\t\t\t\t\t\t\t\t# Default: true"
	echo -e "  [--parent=PARENT]\t\t\t\t\t\t# The parent class for the generated model"
	echo -e "  [--indexes], [--no-indexes]\t\t\t\t\t# Add indexes for references and belongs_to columns"
	echo -e "\t\t\t\t\t\t\t\t# Default: true"
	echo -e "  [--primary-key-type=PRIMARY_KEY_TYPE]\t\t\t\t# The type for primary key"
	echo -e "  --db, [--database=DATABASE]\t\t\t\t\t# The database for your model's migration. By default, the current environment's primary database is used."
	echo -e "  -t, [--test-framework=NAME]\t\t\t\t\t# Test framework to be invoked"
	echo -e "\t\t\t\t\t\t\t\t# Default: test_unit"
	echo -e ""
	echo -e "TestUnit options:"
	echo -e "  [--fixture], [--no-fixture]\t\t\t\t\t# Indicates when to generate fixture"
	echo -e "\t\t\t\t\t\t\t\t# Default: true"
	echo -e "  -r, [--fixture-replacement=NAME]\t\t\t\t# Fixture replacement to be invoked"
	echo -e "  [--system-tests=SYSTEM_TESTS]\t\t\t\t\t# Skip system test files"
	echo -e "\t\t\t\t\t\t\t\t# Default: test_unit"
	echo -e ""
	echo -e "ScaffoldController options:"
	echo -e "  [--helper], [--no-helper]\t\t\t\t\t# Indicates when to generate helper"
	echo -e "\t\t\t\t\t\t\t\t# Default: true"
	echo -e "  [--skip-routes], [--no-skip-routes]\t\t\t\t# Don't add routes to config/routes.rb."
	echo -e "  -e, [--template-engine=NAME]\t\t\t\t\t# Template engine to be invoked"
	echo -e "\t\t\t\t\t\t\t\t# Default: erb"
	echo -e "  [--jbuilder], [--no-jbuilder]\t\t\t\t\t# Indicates when to generate jbuilder"
	echo -e "\t\t\t\t\t\t\t\t# Default: true"
	echo -e ""
	echo -e "Runtime options:"
	echo -e "  -f, [--force]\t\t\t\t\t\t\t# Overwrite files that already exist"
	echo -e "  -p, [--pretend], [--no-pretend]\t\t\t\t# Run but do not make any changes"
	echo -e "  -q, [--quiet], [--no-quiet]\t\t\t\t\t# Suppress status output"
	echo -e "  -s, [--skip], [--no-skip]\t\t\t\t\t# Skip files that already exist"
	echo -e ""
	echo -e "Description:"
    echo -e "  Scaffolds an entire resource, from model and migration to controller and views, along with a full test suite. The resource is ready to use as a starting point for your RESTful, resource-oriented application."
	echo -e ""
	echo -e "  Pass the name of the model (in singular form), either CamelCased or under_scored, as the first argument, and an optional list of attribute pairs."
	echo -e ""
	echo -e "  Attributes are field arguments specifying the model's attributes. You can optionally pass the type and an index to each field. For instance:"
    echo -e "  'title body:text tracking_id:integer:uniq' will generate a title field of string type, a body with text type and a tracking_id as an integer with an unique index. \"index\" could also be given instead of \"uniq\" if one desires a non unique index."
	echo -e ""
	echo -e "  As a special case, specifying 'password:digest' will generate a password_digest field of string type, and configure your generated model, controller, views, and test suite for use with Active Model has_secure_password (assuming they are using maglev defaults)."
	echo -e ""
    echo -e "  Timestamps are added by default, so you don't have to specify them by hand as 'created_at:datetime updated_at:datetime'."
	echo -e ""
    echo -e "  You don't have to think up every attribute up front, but it helps to sketch out a few so you can start working with the resource immediately."
	echo -e ""
    echo -e "  For example, 'scaffold post title body:text published:boolean' gives you a model with those three attributes, a controller that handles the create/show/update/destroy, forms to create and edit your posts, and an index that lists them all, as well as a resources :posts declaration in config/routes.rb."
	echo -e ""
    echo -e "  If you want to remove all the generated files, run 'maglev destroy scaffold ModelName'."
	echo -e ""
	echo -e "Examples:"
    echo -e "  maglev generate scaffold post"
    echo -e "  maglev generate scaffold post title:string body:text published:boolean"
    echo -e "  maglev generate scaffold purchase amount:decimal tracking_id:integer:uniq"
    echo -e "  maglev generate scaffold user email:uniq password:digest"
}

# Generators Function =========================================================
create_controller () {
    echo -e "Controller: ${1}"
}

create_model () {
	echo -e "Model: ${1}"
}

create_route () {
    echo -e "Route: ${1}"
}

# Generators ==================================================================
case "$1" in
	"generate"|"-g")
        case "$2" in
	        "scaffold")
				case "$3" in
					"")
						help_scaffold
						exit 1
					;;
					*)
						if [[ "$3" != "" ]]; then
							create_controller $3
							create_model $3
							create_route $3
							exit 0
						fi
					;;
				esac
	        ;;
	        "controller")
				case "$3" in
					"")
						help_controller
						exit 1
					;;
					*)
						if [[ "$3" != "" ]]; then
							create_controller $3
							exit 0
						fi
					;;
				esac
	        ;;
	        "model")
				case "$3" in
					"")
						help_model
						exit 1
					;;
					*)
						if [[ "$3" != "" ]]; then
							create_model $3
							exit 0
						fi
					;;
				esac
	        ;;
	        "route")
				case "$3" in
					"")
						help_route
						exit 1
					;;
					*)
						if [[ "$3" != "" ]]; then
							create_route $3
							exit 0
						fi
					;;
				esac
	        ;;
	        "")
				help_generate
	            exit 1
	        ;;
        esac
    ;;
	"help"|"-h")
		general_help
		exit 0
    ;;
    *)
		general_help
		exit 1
	;;
esac
