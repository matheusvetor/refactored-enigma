threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }

environment ENV.fetch("RAILS_ENV") { "development" }

plugin :tmp_restart

on_worker_boot do
  @sidekiq_pid ||= spawn('bundle exec sidekiq -t 1')
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

on_restart do
  Sidekiq.redis.shutdown { |conn| conn.close }
end
