# Capistrano 3.x :: Unicorn

Unicorn specific tasks for Capistrano 3.x

```
cap unicorn:start                  # Start unicorn
cap unicorn:stop                   # Stop unicorn gracefully (QUIT)
cap unicorn:shutdown               # Stop unicorn immediately (TERM)
cap unicorn:restart                # Restart unicorn
cap unicorn:restart_hup            # Restart unicorn, when preload_app is false (HUP)
cap unicorn:restart_usr2           # Restart unicorn, when before_fork hook is set and preload_app is true (USR2)
cap unicorn:restart_usr2_quit      # Restart unicorn, when before_fork hook is not set and preload_app is true (USR2 + QUIT)
cat unicorn:restart_quit           # Restart unicorn, simple stop it gracefully and start again (QUIT)
cat unicorn:restart_term           # Restart unicorn, simple stop it immediately and start it again (TERM)
cap unicorn:add_worker[count]      # Add a worker (TTIN)
cap unicorn:remove_worker[count]   # Remove a worker (TTOU)
cap unicorn:stop_workers           # Stop all workers but keep the master running (WINCH)
cap unicorn:reopen_logs            # Reopen all logs owned by the master and all workers (USR1)
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-unicorn-edge', require: false, group: :development
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install capistrano-unicorn-edge
```

## Usage

Require in `Capfile` to use tasks:
```ruby
require 'capistrano/unicorn'
```

Configurable options:
```ruby
set :unicorn_pid, -> { current_path.join('tmp/pids/unicorn.pid') } # this is default
set :unicorn_config, -> { current_path.join("config/unicorn/#{fetch(:rails_env)}.rb") } # this is default
set :unicorn_roles, :app # this is default
set :unicorn_options, '' # this is default
set :unicorn_restart_delay, 5 # this is default
set :unicorn_rack_env, :deployment # this is default
set :unicorn_restart_method, :restart_usr2 # this is default
```

Everything should work **out of the box** but you need to **set up unicorn's config**. (see an example `examples/unicorn.rb`).

There are three different ways to restart server:
* `:restart_hup` restarts all workers and therefore all code changes, makes sense if `preload_app` is false
* `:restart_usr2_quit` re-executes the running binary and stops previous instance in `:unicorn_restart_delay`
* `:restart_usr2` the same as above but `before_fork` hook has to be set, default and the best choice
* `:restart_quit` stops server gracefully and starts it again in `:unicorn_restart_delay`
* `:restart_term` stops server immediately and starts it again

Using methods which are based on `QUIT` signal can't be absolutely reliable

## Contributing

1. Fork it ( https://github.com/amenzhinsky/capistrano-unicorn-edge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
