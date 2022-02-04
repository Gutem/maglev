# Maglev

### About
This is a CLI tool to create projects using Node & Express to build APIs, Lambda, SSR (Server Side Rendered) or MVC (Model-View-Controller) Applications.  
Maglev can create microservices using RESTful endpoints as well gRPC (GraphQL in a near future).  

This is heavily inspired by my experience developing using Ruby on Rails.

### How to use

maglev new  
maglev server  
maglev generate  


```
maglev --help

Usage:
  maglev new APP_PATH [options]

Options:
      [--skip-namespace]            # Skip namespace (affects only isolated engines)
  -r, [--ruby=PATH]                 # Path to the NodeJS binary of your choice
                                    # Default: $HOME/bin/node
  -d, [--database=DATABASE]         # Preconfigure for selected database (options: sqlite3 (default), mysql, postgresql, mongodb)
      [--api]                       # Preconfigure smaller stack for API only apps
      [--minimal]                   # Preconfigure a minimal rails app
  -j, [--javascript=JAVASCRIPT]     # Choose JavaScript approach [options: importmap (default), webpack, esbuild, rollup]
  -l, [--lint=JAVASCRIPT]           # Choose lint approach [options: eslint (default)]
  -c, [--css=CSS]                   # Choose CSS processor [options: tailwind, bootstrap, bulma, postcss, sass...]
  -B, [--skip-bundle]               # Don't run npm install

Runtime options:
  -f, [--force]                     # Overwrite files that already exist
  -q, [--quiet]                     # Suppress status output
  -s, [--skip]                      # Skip files that already exist

Maglev options:
  -h, [--help]                      # Show this help message and quit
  -v, [--version]                   # Show Maglev version number and quit

Description:
    The 'maglev new' command creates a new Maglev application with a default
    directory structure and configuration at the path you specify.

    You can specify extra command-line arguments to be used every time
    'maglev new' runs in the .maglevrc configuration file in your home directory,
    or in $XDG_CONFIG_HOME/rails/maglevrc if XDG_CONFIG_HOME is set.

    Note that the arguments specified in the .maglevrc file don't affect the
    defaults values shown above in this help message.

Example:
    maglev new ~/code/weblog

    This generates a skeletal Maglev installation in ~/code/weblog.
```


#### Creating a new Project
The first thing we'll want to do is create a new Maglev application by running the `maglev new` command after installing Maglev.
```
$ maglev new <project name>
      create
      create  README.md
      create  config.json
      create  .gitignore
      create  package.json
         run  git init from "."
Initialized empty Git repository in /Users/guteembergcarvalho/project/.git/
      create  app
      create  app/assets/config/manifest.js
      create  app/assets/stylesheets/application.css
      create  app/channels/application_cable/channel.rb
      create  app/channels/application_cable/connection.rb
      create  app/controllers/application_controller.rb
      create  app/helpers/application_helper.rb
      create  app/jobs/application_job.rb
      create  app/mailers/application_mailer.rb
      create  app/models/application_record.rb
      create  app/views/layouts/application.html.erb
      create  app/views/layouts/mailer.html.erb
      create  app/views/layouts/mailer.text.erb
      create  app/assets/images
      create  app/assets/images/.keep
      create  app/controllers/concerns/.keep
      create  app/models/concerns/.keep
      create  bin
      create  bin/rails
      create  bin/rake
      create  bin/setup
      create  config
      create  config/routes.rb
      create  config/application.rb
      create  config/environment.rb
      create  config/cable.yml
      create  config/puma.rb
      create  config/storage.yml
      create  config/environments
      create  config/environments/development.rb
      create  config/environments/production.rb
      create  config/environments/test.rb
      create  config/initializers
      create  config/initializers/assets.rb
      create  config/initializers/content_security_policy.rb
      create  config/initializers/cors.rb
      create  config/initializers/filter_parameter_logging.rb
      create  config/initializers/inflections.rb
      create  config/initializers/new_framework_defaults_7_0.rb
      create  config/initializers/permissions_policy.rb
      create  config/locales
      create  config/locales/en.yml
      create  config/master.key
      append  .gitignore
      create  config/boot.rb
      create  config/database.yml
      create  db
      create  db/seeds.rb
      create  lib
      create  lib/tasks
      create  lib/tasks/.keep
      create  lib/assets
      create  lib/assets/.keep
      create  log
      create  log/.keep
      create  public
      create  public/404.html
      create  public/422.html
      create  public/500.html
      create  public/apple-touch-icon-precomposed.png
      create  public/apple-touch-icon.png
      create  public/favicon.ico
      create  public/robots.txt
      create  tmp
      create  tmp/.keep
      create  tmp/pids
      create  tmp/pids/.keep
      create  tmp/cache
      create  tmp/cache/assets
      create  vendor
      create  vendor/.keep
      create  test/fixtures/files
      create  test/fixtures/files/.keep
      create  test/controllers
      create  test/controllers/.keep
      create  test/mailers
      create  test/mailers/.keep
      create  test/models
      create  test/models/.keep
      create  test/helpers
      create  test/helpers/.keep
      create  test/integration
      create  test/integration/.keep
      create  test/channels/application_cable/connection_test.rb
      create  test/test_helper.rb
      create  test/system
      create  test/system/.keep
      create  test/application_system_test_case.rb
      create  storage
      create  storage/.keep
      create  tmp/storage
      create  tmp/storage/.keep
      remove  config/initializers/cors.rb
      remove  config/initializers/new_framework_defaults_7_0.rb
         run  npm install
Fetching gem metadata from https://rubygems.org/............
Resolving dependencies....
Fetching rake 13.0.6
Installing rake 13.0.6
Using concurrent-ruby 1.1.9
Fetching minitest 5.15.0
Using erubi 1.10.0
Using crass 1.0.6
Using bundler 2.2.32
Using rack 2.2.3
Using nio4r 2.5.8
Fetching matrix 0.4.2
Fetching childprocess 4.1.0
Fetching racc 1.6.0
Using builder 3.2.4
Fetching public_suffix 4.0.6
Fetching bindex 0.8.1
Fetching msgpack 1.4.2
Using websocket-extensions 0.1.5
Using marcel 1.0.2
Fetching regexp_parser 2.2.0
Using mini_mime 1.1.2
Fetching io-console 0.5.9
Using zeitwerk 2.5.1
Using method_source 1.0.0
Using thor 1.1.0
Using rexml 3.2.5
Fetching sqlite3 1.4.2
Using i18n 1.8.11
Using tzinfo 2.0.4
Fetching rubyzip 2.3.2
Using rack-test 1.1.0
Fetching sprockets 4.0.2
Installing matrix 0.4.2
Installing childprocess 4.1.0
Installing racc 1.6.0 with native extensions
Installing bindex 0.8.1 with native extensions
Installing io-console 0.5.9 with native extensions
Fetching puma 5.5.2
Installing msgpack 1.4.2 with native extensions
Installing public_suffix 4.0.6
Installing rubyzip 2.3.2
Installing regexp_parser 2.2.0
Installing sprockets 4.0.2
Installing minitest 5.15.0
Using websocket-driver 0.7.5
Using mail 2.7.1
Installing puma 5.5.2 with native extensions
Using activesupport 7.0.0
Using globalid 1.0.0
Using activemodel 7.0.0
Using activejob 7.0.0
Using activerecord 7.0.0
Fetching selenium-webdriver 4.1.0
Fetching addressable 2.8.0
Installing addressable 2.8.0
Installing selenium-webdriver 4.1.0
Installing sqlite3 1.4.2 with native extensions
Using nokogiri 1.12.5 (x86_64-darwin)
Using rails-dom-testing 2.0.3
Fetching xpath 3.2.0
Fetching webdrivers 5.0.0
Using loofah 2.13.0
Using rails-html-sanitizer 1.4.2
Using actionview 7.0.0
Using actionpack 7.0.0
Using actionmailer 7.0.0
Using railties 7.0.0
Fetching sprockets-rails 3.4.2
Using actioncable 7.0.0
Fetching jbuilder 2.11.5
Fetching importmap-rails 1.0.1
Fetching stimulus-rails 1.0.2
Using activestorage 7.0.0
Fetching turbo-rails 1.0.0
Fetching web-console 4.2.0
Installing xpath 3.2.0
Installing webdrivers 5.0.0
Installing jbuilder 2.11.5
Installing turbo-rails 1.0.0
Using actionmailbox 7.0.0
Using actiontext 7.0.0
Fetching capybara 3.36.0
Installing importmap-rails 1.0.1
Using rails 7.0.0
Installing web-console 4.2.0
Installing capybara 3.36.0
Installing sprockets-rails 3.4.2
Installing stimulus-rails 1.0.2
Fetching reline 0.2.7
Installing reline 0.2.7
Fetching irb 1.3.7
Installing irb 1.3.7
Fetching debug 1.4.0
Installing debug 1.4.0 with native extensions
Fetching bootsnap 1.9.3
Installing bootsnap 1.9.3 with native extensions
Bundle complete! 15 Gemfile dependencies, 66 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
         run  bundle binstubs bundler
       rails  importmap:install
Add Importmap include tags in application layout
      insert  app/views/layouts/application.html.erb
Create application.js module as entrypoint
      create  app/javascript/application.js
Use vendor/javascript for downloaded pins
      create  vendor/javascript
      create  vendor/javascript/.keep
Ensure JavaScript files are in the Sprocket manifest
      append  app/assets/config/manifest.js
Configure importmap paths in config/importmap.rb
      create  config/importmap.rb
Copying binstub
      create  bin/importmap
       rails  turbo:install stimulus:install
Import Turbo
      append  app/javascript/application.js
Pin Turbo
      append  config/importmap.rb
Run turbo:install:redis to switch on Redis and use it in development for turbo streams
Create controllers directory
      create  app/javascript/controllers
      create  app/javascript/controllers/index.js
      create  app/javascript/controllers/application.js
      create  app/javascript/controllers/hello_controller.js
Import Stimulus controllers
      append  app/javascript/application.js
Pin Stimulus
      append  config/importmap.rb
```
Maglev will set you up with what seems like a huge amount of stuff for such a tiny command! You've got the entire Maglev directory structure now with all the code you need to run our simple application right out of the box.

If you wish to skip some files or components from being generated, you can append the following arguments to your rails new command:

| Argument | Description |
| -------- | ----------- |
| --api | Create a API based Project |
| --ssr | Create a SSR based Project |
| --mvc | Create a MVC based Project |
| --lambda | Create a Lambda Project |
| --grpc | Create a gRPC based Project |

#### server
The `maglev server` command launches a web server named Nodemon which comes bundled with Maglev. You'll use this any time you want to access your application through a web browser.

With no further work, `maglev server` will run our new shiny Maglev app:
```
$ cd <project name>
$ maglev server
=> Booting Puma
=> Maglev 6.0.0 application starting in development
=> Run `maglev server --help` for more startup options
Puma starting in single mode...
* Version 3.12.1 (ruby 2.5.7-p206), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```
With just three commands we whipped up a Maglev server listening on port 3000. Go to your browser and open http://localhost:3000, you will see a basic Maglev app running.

You can also use the alias "s" to start the server: `$ maglev s`.

The server can be run on a different port using the -p option. The default development environment can be changed using -e.
```
$ maglev server -e production -p 4000
```

You can run a server as a daemon by passing a -d option.

#### generate
The `maglev generate` command uses templates to create a whole lot of things. Running maglev generate by itself gives a list of available generators:

You can also use the alias "g" to invoke the generator command: `$ maglev g`.
```
$ maglev generate
Usage: maglev generate GENERATOR [args] [options]

General options:
  -h, [--help]     # Print generator's options and usage
  -p, [--pretend]  # Run but do not make any changes
  -f, [--force]    # Overwrite files that already exist
  -s, [--skip]     # Skip files that already exist
  -q, [--quiet]    # Suppress status output

Please choose a generator below.

Rails:
  application_record
  benchmark
  channel
  controller
  generator
  helper
  integration_test
  jbuilder
  job
  mailbox
  mailer
  migration
  model
  resource
  scaffold
  scaffold_controller
  system_test
  task

ActiveRecord:
  active_record:application_record
  active_record:multi_db

Stimulus:
  stimulus

TestUnit:
  test_unit:channel
  test_unit:generator
  test_unit:install
  test_unit:mailbox
  test_unit:plugin
```
You can install more generators through generator gems, portions of plugins you'll undoubtedly install, and you can even create your own!

Using generators will save you a large amount of time by writing boilerplate code, code that is necessary for the app to work.

Let's make our own controller with the controller generator. But what command should we use? Let's ask the generator:

All Maglev console utilities have help text. As with most \*nix utilities, you can try adding --help or -h to the end, for example maglev server --help.

##### scaffold
```
$ maglev g scaffold
Usage:
  maglev generate scaffold NAME [field[:type][:index] field[:type][:index]] [options]

Options:
      [--skip-namespace], [--no-skip-namespace]              # Skip namespace (affects only isolated engines)
      [--skip-collision-check], [--no-skip-collision-check]  # Skip collision check
      [--force-plural], [--no-force-plural]                  # Forces the use of the given model name
  -o, --orm=NAME                                             # ORM to be invoked
                                                             # Default: active_record
      [--model-name=MODEL_NAME]                              # ModelName to be used
      [--resource-route], [--no-resource-route]              # Indicates when to generate resource route
                                                             # Default: true
      [--api], [--no-api]                                    # Indicates when to generate api
  -c, --scaffold-controller=NAME                             # Scaffold controller to be invoked
                                                             # Default: scaffold_controller

ActiveRecord options:
      [--migration], [--no-migration]        # Indicates when to generate migration
                                             # Default: true
      [--timestamps], [--no-timestamps]      # Indicates when to generate timestamps
                                             # Default: true
      [--parent=PARENT]                      # The parent class for the generated model
      [--indexes], [--no-indexes]            # Add indexes for references and belongs_to columns
                                             # Default: true
      [--primary-key-type=PRIMARY_KEY_TYPE]  # The type for primary key
  --db, [--database=DATABASE]                # The database for your model's migration. By default, the current environment's primary database is used.
  -t, [--test-framework=NAME]                # Test framework to be invoked
                                             # Default: test_unit

TestUnit options:
      [--fixture], [--no-fixture]    # Indicates when to generate fixture
                                     # Default: true
  -r, [--fixture-replacement=NAME]   # Fixture replacement to be invoked
      [--system-tests=SYSTEM_TESTS]  # Skip system test files
                                     # Default: test_unit

ScaffoldController options:
      [--helper], [--no-helper]            # Indicates when to generate helper
                                           # Default: true
      [--skip-routes], [--no-skip-routes]  # Don't add routes to config/routes.rb.
  -e, [--template-engine=NAME]             # Template engine to be invoked
                                           # Default: erb
      [--jbuilder], [--no-jbuilder]        # Indicates when to generate jbuilder
                                           # Default: true

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Scaffolds an entire resource, from model and migration to controller and
    views, along with a full test suite. The resource is ready to use as a
    starting point for your RESTful, resource-oriented application.

    Pass the name of the model (in singular form), either CamelCased or
    under_scored, as the first argument, and an optional list of attribute
    pairs.

    Attributes are field arguments specifying the model's attributes. You can
    optionally pass the type and an index to each field. For instance:
    'title body:text tracking_id:integer:uniq' will generate a title field of
    string type, a body with text type and a tracking_id as an integer with an
    unique index. "index" could also be given instead of "uniq" if one desires
    a non unique index.

    As a special case, specifying 'password:digest' will generate a
    password_digest field of string type, and configure your generated model,
    controller, views, and test suite for use with Active Model
    has_secure_password (assuming they are using Rails defaults).

    Timestamps are added by default, so you don't have to specify them by hand
    as 'created_at:datetime updated_at:datetime'.

    You don't have to think up every attribute up front, but it helps to
    sketch out a few so you can start working with the resource immediately.

    For example, 'scaffold post title body:text published:boolean' gives
    you a model with those three attributes, a controller that handles
    the create/show/update/destroy, forms to create and edit your posts, and
    an index that lists them all, as well as a resources :posts declaration
    in config/routes.rb.

    If you want to remove all the generated files, run
    'maglev destroy scaffold ModelName'.

Examples:
    `maglev generate scaffold post`
    `maglev generate scaffold post title:string body:text published:boolean`
    `maglev generate scaffold purchase amount:decimal tracking_id:integer:uniq`
    `maglev generate scaffold user email:uniq password:digest`
```
##### controller
```
$ maglev generate controller
Usage:
  maglev generate controller NAME [action action] [options]

Options:
      [--skip-namespace], [--no-skip-namespace]              # Skip namespace (affects only isolated engines)
      [--skip-collision-check], [--no-skip-collision-check]  # Skip collision check
      [--skip-routes], [--no-skip-routes]                    # Don't add routes to config/routes.rb.
      [--helper], [--no-helper]                              # Indicates when to generate helper
                                                             # Default: true
  -e, [--template-engine=NAME]                               # Template engine to be invoked
                                                             # Default: ejs
  -t, [--test-framework=NAME]                                # Test framework to be invoked
                                                             # Default: test_unit

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Generates a new controller and its views. Pass the controller name, either
    CamelCased or under_scored, and a list of views as arguments.

    To create a controller within a module, specify the controller name as a
    path like 'parent_module/controller_name'.

    This generates a controller class in app/controllers and invokes helper,
    template engine, assets, and test framework generators.

Example:
    `bin/rails generate controller CreditCards open debit credit close`

    CreditCards controller with URLs like /credit_cards/debit.
        Controller: app/controllers/credit_cards_controller.rb
        Test:       test/controllers/credit_cards_controller_test.rb
        Views:      app/views/credit_cards/debit.html.erb [...]
        Helper:     app/helpers/credit_cards_helper.rb
```
The controller generator is expecting parameters in the form of `generate controller ControllerName action1 action2`. Let's make a Greetings controller with an action of hello, which will say something nice to us.
```
$ maglev generate controller Greetings hello
     create  app/controllers/greetings_controller.js
      route  get 'greetings/hello'
     invoke  ejs
     create    app/views/greetings
     create    app/views/greetings/hello.html.ejs
     invoke  test_unit
     create    test/controllers/greetings_controller_test.js
     invoke  helper
     create    app/helpers/greetings_helper.js
     invoke    test_unit
```
What all did this generate? It made sure a bunch of directories were in our application, and created a controller file, a view file, a functional test file, a helper for the view, a JavaScript file, and a stylesheet file.

Check out the controller and modify it a little (in app/controllers/greetings_controller.js):
```
class GreetingsController < ApplicationController
  def hello
    @message = "Hello, how are you today?"
  end
end
```
Then the view, to display our message (in app/views/greetings/hello.html.ejs):
```
<h1>A Greeting for You!</h1>
<p><%= @message %></p>
```
Fire up your server using maglev server.
```
$ maglev server
=> Booting Puma...
```
The URL will be http://localhost:3000/greetings/hello.

With a normal, plain-old Maglev application, your URLs will generally follow the pattern of http://(host)/(controller)/(action), and a URL like http://(host)/(controller) will hit the index action of that controller.

#### model

```
$ maglev generate model 
Usage:
  maglev generate model NAME [field[:type][:index] field[:type][:index]] [options]

Options:
      [--skip-namespace], [--no-skip-namespace]              # Skip namespace (affects only isolated engines)
      [--skip-collision-check], [--no-skip-collision-check]  # Skip collision check
      [--force-plural], [--no-force-plural]                  # Forces the use of the given model name
  -o, --orm=NAME                                             # ORM to be invoked
                                                             # Default: active_record

ActiveRecord options:
      [--migration], [--no-migration]        # Indicates when to generate migration
                                             # Default: true
      [--timestamps], [--no-timestamps]      # Indicates when to generate timestamps
                                             # Default: true
      [--parent=PARENT]                      # The parent class for the generated model
      [--indexes], [--no-indexes]            # Add indexes for references and belongs_to columns
                                             # Default: true
      [--primary-key-type=PRIMARY_KEY_TYPE]  # The type for primary key
  --db, [--database=DATABASE]                # The database for your model's migration. By default, the current environment's primary database is used.
  -t, [--test-framework=NAME]                # Test framework to be invoked
                                             # Default: test_unit

TestUnit options:
      [--fixture], [--no-fixture]   # Indicates when to generate fixture
                                    # Default: true
  -r, [--fixture-replacement=NAME]  # Fixture replacement to be invoked

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Generates a new model. Pass the model name, either CamelCased or
    under_scored, and an optional list of attribute pairs as arguments.

    Attribute pairs are field:type arguments specifying the
    model's attributes. Timestamps are added by default, so you don't have to
    specify them by hand as 'created_at:datetime updated_at:datetime'.

    As a special case, specifying 'password:digest' will generate a
    password_digest field of string type, and configure your generated model and
    tests for use with Active Model has_secure_password (assuming the default ORM
    and test framework are being used).

    You don't have to think up every attribute up front, but it helps to
    sketch out a few so you can start working with the model immediately.

    This generator invokes your configured ORM and test framework, which
    defaults to Active Record and TestUnit.

    Finally, if --parent option is given, it's used as superclass of the
    created model. This allows you create Single Table Inheritance models.

    If you pass a namespaced model name (e.g. admin/account or Admin::Account)
    then the generator will create a module with a table_name_prefix method
    to prefix the model's table name with the module name (e.g. admin_accounts)

Available field types:

    Just after the field name you can specify a type like text or boolean.
    It will generate the column with the associated SQL type. For instance:

        `bin/rails generate model post title:string body:text`

    will generate a title column with a varchar type and a body column with a text
    type. If no type is specified the string type will be used by default.
    You can use the following types:

        integer
        primary_key
        decimal
        float
        boolean
        binary
        string
        text
        date
        time
        datetime

    You can also consider `references` as a kind of type. For instance, if you run:

        `bin/rails generate model photo title:string album:references`

    It will generate an `album_id` column. You should generate these kinds of fields when
    you will use a `belongs_to` association, for instance. `references` also supports
    polymorphism, you can enable polymorphism like this:

        `bin/rails generate model product supplier:references{polymorphic}`

    For integer, string, text and binary fields, an integer in curly braces will
    be set as the limit:

        `bin/rails generate model user pseudo:string{30}`

    For decimal, two integers separated by a comma in curly braces will be used
    for precision and scale:

        `bin/rails generate model product 'price:decimal{10,2}'`

    You can add a `:uniq` or `:index` suffix for unique or standard indexes
    respectively:

        `bin/rails generate model user pseudo:string:uniq`
        `bin/rails generate model user pseudo:string:index`

    You can combine any single curly brace option with the index options:

        `bin/rails generate model user username:string{30}:uniq`
        `bin/rails generate model product supplier:references{polymorphic}:index`

    If you require a `password_digest` string column for use with
    has_secure_password, you can specify `password:digest`:

        `bin/rails generate model user password:digest`

    If you require a `token` string column for use with
    has_secure_token, you can specify `auth_token:token`:

        `bin/rails generate model user auth_token:token`

Examples:
    `bin/rails generate model account`

        For Active Record and TestUnit it creates:

            Model:      app/models/account.rb
            Test:       test/models/account_test.rb
            Fixtures:   test/fixtures/accounts.yml
            Migration:  db/migrate/XXX_create_accounts.rb

    `bin/rails generate model post title:string body:text published:boolean`

        Creates a Post model with a string title, text body, and published flag.

    `bin/rails generate model admin/account`

        For Active Record and TestUnit it creates:

            Module:     app/models/admin.rb
            Model:      app/models/admin/account.rb
            Test:       test/models/admin/account_test.rb
            Fixtures:   test/fixtures/admin/accounts.yml
            Migration:  db/migrate/XXX_create_admin_accounts.rb
```
For a list of available field types for the type parameter, refer to the API documentation for the add_column method for the SchemaStatements module. The index parameter generates a corresponding index for the column.

But instead of generating a model directly (which we'll be doing later), let's set up a scaffold. A scaffold in Maglev is a full set of model, database migration for that model, controller to manipulate it, views to view and manipulate the data, and a test suite for each of the above.

We will set up a simple resource called "HighScore" that will keep track of our highest score on video games we play.
```
$ maglev generate scaffold HighScore game:string score:integer
    invoke  active_record
    create    db/migrate/20190416145729_create_high_scores.js
    create    app/models/high_score.js
    invoke    test_unit
    create      test/models/high_score_test.js
    create      test/fixtures/high_scores.yml
    invoke  resource_route
     route    resources :high_scores
    invoke  scaffold_controller
    create    app/controllers/high_scores_controller.js
    invoke    ejs
    create      app/views/high_scores
    create      app/views/high_scores/index.html.ejs
    create      app/views/high_scores/edit.html.ejs
    create      app/views/high_scores/show.html.ejs
    create      app/views/high_scores/new.html.ejs
    create      app/views/high_scores/_form.html.ejs
    invoke    test_unit
    create      test/controllers/high_scores_controller_test.js
    create      test/system/high_scores_test.js
    invoke    helper
    create      app/helpers/high_scores_helper.js
    invoke      test_unit
    invoke    jbuilder
    create      app/views/high_scores/index.json.jbuilder
    create      app/views/high_scores/show.json.jbuilder
    create      app/views/high_scores/_high_score.json.jbuilder
```
The generator checks that there exist the directories for models, controllers, helpers, layouts, functional and unit tests, stylesheets, creates the views, controller, model and database migration for HighScore (creating the high_scores table and fields), takes care of the route for the resource, and new tests for everything.

##### routes
Maglev routes will list all of your defined routes, which is useful for tracking down routing problems in your app, or giving you a good overview of the URLs in an app you're trying to get familiar with.

##### test
A good description of unit testing in Maglev is given in A Guide to Testing Maglev Applications

Maglev comes with a test framework called minitest. Maglev owes its stability to the use of tests. The commands available in the test: namespace helps in running the different tests you will hopefully write.


### Secure by Design
Maglev implement some Security Best Practices out of box.

Maglev uses [Helmet](https://helmetjs.github.io/) and, by default, implements 11 middlewares, from 15 totals, to enforce security.

