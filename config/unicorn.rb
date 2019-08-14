rails_root = ENV['RAILS_ROOT'] || File.expand_path('../../', __FILE__)

worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
 timeout 15
 preload_app true
 working_directory rails_root
 listen '/var/www/secondhouse/tmp/sokets/unicorn.sock'
 pid    '/var/www/secondhouse/tmp/pids/unicorn.pid'

 before_fork do |server, worker|
  ApplicationRecord.connection.disconnect! if defined?(ApplicationRecord) && ApplicationRecord.connected?

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
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
