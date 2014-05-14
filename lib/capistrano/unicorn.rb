def unicorn_is_running?(pidfile = fetch(:unicorn_pid))
  test "[[ -e #{pidfile} ]] && $(kill -0 $(cat #{pidfile}) &> /dev/null)"
end

def unicorn_start
  within release_path do
    with rails_env: fetch(:rails_env) do
      execute :bundle, 'exec', 'unicorn',  '-c', fetch(:unicorn_config),
                                           '-E', fetch(:unicorn_rack_env),
                                           '-D', fetch(:unicorn_options)
    end
  end
end

def unicorn_old_pid
  "#{fetch(:unicorn_pid)}.oldbin"
end

def unicorn_send_signal(signal, pidfile = fetch(:unicorn_pid))
  execute :kill, "-#{signal}", capture(:cat, pidfile)
end

load File.expand_path('../tasks/unicorn.cap', __FILE__)
