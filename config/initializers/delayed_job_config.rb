Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 10.seconds
Delayed::Worker.max_attempts = 10
Delayed::Worker.max_run_time = 1.minute
Delayed::Worker.read_ahead = 10