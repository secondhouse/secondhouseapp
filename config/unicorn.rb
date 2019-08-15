<<<<<<< HEAD
rails_root = ENV['RAILS_ROOT'] || File.expand_path('../../', __FILE__)

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
 timeout 15
 preload_app true
 working_directory rails_root
 listen '/var/www/secondhouse/tmp/sokets/unicorn.sock'
 pid    '/var/www/secondhouse/tmp/pids/unicorn.pid'

 before_fork do |server, worker|
  ApplicationRecord.connection.disconnect! if defined?(ApplicationRecord) && ApplicationRecord.connected?
=======
rails_root = File.expand_path('../../', __FILE__)

ENV['BUNDLE_GEMFILE'] = rails_root + "/Gemfile"

worker_processes 2

working_directory rails_root

timeout 30

stderr_path File.expand_path('../../log/unicorn_stderr.log', __FILE__)
stdout_path File.expand_path('../../log/unicorn_stdout.log', __FILE__)

###注
# Nginxで使用する場合は以下の設定を行う。
listen File.expand_path('/var/run/unicorn/unicorn.sock', __FILE__)
# Unicorn単体で使う場合は以下。
#listen 8080

pid File.expand_path('../../tmp/pids/unicorn.pid', __FILE__)


preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
>>>>>>> refs/remotes/origin/master

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
<<<<<<< HEAD
      # USR2シグナルを受けると古いプロセスを止める
       sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
       Process.kill(sig, File.read(old_pid).to_i)
     rescue Errno::ENOENT, Errno::ESRCH
    end
   end
  end
    
  after_fork do |_server, _worker|
       ApplicationRecord.establish_connection if defined?(ApplicationRecord)
  end
 stderr_path File.expand_path('/var/www/secondhouse/current/log/unicorn_stderr.log', ENV['RAILS_ROOT'])
 stdout_path File.expand_path('/var/www/secondhouse/current/log/unicorn_stdout.log', ENV['RAILS_ROOT'])
=======
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
>>>>>>> refs/remotes/origin/master
