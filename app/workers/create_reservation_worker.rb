# Use worker instead of activejob interface as it does not support shoryuken_options

class CreateReservationWorker
  include Shoryuken::Worker

  shoryuken_options queue: 'lh-inventory', auto_delete: true

  def perform(sqs_message, reservation_id)
    puts("reservation: #{reservation_id}")

    PropertyReportSyncWorker.perform_async(reservation_id)
  end
end