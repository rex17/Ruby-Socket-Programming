require 'logger'
require	'securerandom'

class CustomLogger

  attr_accessor :logger, :start_time, :end_time, :time_duration

  def initialize app_name
    @app_name = app_name
    @start_time = Time.now
    log_file_path = File.dirname(File.expand_path('../', __FILE__)) + '/logs/log_file.txt'
    @logger = Logger.new(log_file_path, 10, 10*1024*1024)
    @logger.level = Logger::DEBUG
    @logger.datetime_format = '%Y-%m-%d %H:%M:%S '
  end

  def log_app_started
    @logger.info "======================app #{@app_name} STARTED - #{@start_time} ======================"
  end

  def get_logger_handle
    @logger
  end

  def log_app_ended
    @end_time = Time.now
    logapp_duration
    @logger.info "======================app #{@app_name} ENDED - #{@end_time} ======================"
  end

  def log_execution_time
    duration_in_minutes = (@end_time - @start_time)/60
    @logger.info " Duration time - #{duration_in_minutes}"
  end
  
  def info log_text
    @logger.info { log_text }
  end

  def debug log_text
    @logger.debug { log_text }
  end

  def error log_text
    @logger.error { log_text }
  end

  def warn log_text
    @logger.warn { log_text }
  end

  def fatal log_text
    @logger.fatal { log_text }
  end

  def log_uuid(uid='')
    if uid=='' or uid=='undefined'
      uid = (SecureRandom.hex(24).length==24) ? SecureRandom.hex(24) : SecureRandom.hex(12)
    end
    @logger.info "logId : #{uid} reflection controller request body #{@app_name}"
    uid
  end
end