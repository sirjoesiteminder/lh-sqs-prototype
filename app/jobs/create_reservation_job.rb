class CreateReservationJob < ActiveJob::Base
  queue_as 'lh-inventory'

  def perform(reservation_id)
    puts("reservation: #{reservation_id}")

    PropertyReportSyncJob.perform_later(reservation_id, Date.today.to_s)
  end
end