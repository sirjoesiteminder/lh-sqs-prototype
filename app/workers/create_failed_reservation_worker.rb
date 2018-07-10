# Use worker instead of activejob interface as it does not support shoryuken_options

class CreateFailedReservationWorker
  include Shoryuken::Worker

  shoryuken_options queue: 'lh-inventory', auto_delete: true, retry_intervals: [2.seconds, 5.seconds, 10.seconds]

  def perform(sqs_message, reservation_id)
    raise "Error occured while creating reservation #{reservation_id}"
  end
end