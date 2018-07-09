class PropertyReportSyncJob < ActiveJob::Base
  queue_as 'lh-report'

  def perform(reservation_id, date)
    puts("report sync for reservation: #{reservation_id}, date: #{date}")
  end
end