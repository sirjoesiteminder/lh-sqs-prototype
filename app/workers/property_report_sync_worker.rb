class PropertyReportSyncWorker < ActiveJob::Base
  include Shoryuken::Worker

  shoryuken_options queue: 'lh-report', auto_delete: true

  def perform(sqs_message, reservation_id)
    puts("report sync for reservation: #{reservation_id}")
  end
end