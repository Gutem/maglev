#!/bin/bash

# Help info ===================================================================
general_help () {
	echo -e "Usage:"
	echo -e "  maglev new APP_PATH [options]"
	echo -e "Options:"
	echo -e "  [--skip-namespace]\t\t\t# Skip namespace (affects only isolated engines)"
	echo -e "  -d, [--database=DATABASE]\t\t# Preconfigure for selected database (options: sqlite3 (default), mysql, postgresql, mongodb)"
	echo -e "  [--api]\t\t\t\t# Preconfigure smaller stack for API only apps"
	echo -e "  [--minimal]\t\t\t\t# Preconfigure a minimal rails app"
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
	echo -e "  You can specify extra command-line arguments to be used every time 'maglev new' runs in the .maglevrc configuration file in your home directory, or in $XDG_CONFIG_HOME/rails/maglevrc if XDG_CONFIG_HOME is set."
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
	echo -e "Usage:\n\tmaglev generate|-g controller [options]\n"
	echo -e "Options:\n\tContoller\n\tModel\n\tRoute\n\tScaffold"
}

help_model () {
	echo -e "Usage:\n\tmaglev generate|-g model [options]\n"
	echo -e "Options:\n\tContoller\n\tModel\n\tRoute\n\tScaffold"
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
	echo -e "  As a special case, specifying 'password:digest' will generate a password_digest field of string type, and configure your generated model, controller, views, and test suite for use with Active Model has_secure_password (assuming they are using Rails defaults)."
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

# Generators ==================================================================
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
					*)
						help_scaffold
						exit 1
					;;
				esac
	        ;;
	        "controller")
				case "$3" in
					"")
						help_controller
						exit 1
					;;
				esac
	        ;;
	        "model")
				case "$3" in
					"")
						help_model
						exit 1
					;;
				esac
	        ;;
	        "route")
				case "$3" in
					"")
						help_route
						exit 1
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
