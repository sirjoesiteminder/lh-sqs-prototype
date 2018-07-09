namespace :reservation do
  desc "create new reservation jobs"

  task :create, [:count] => :environment do |t, args|
    args.with_defaults(count: 1)

    args[:count].to_i.times do |i|
      CreateReservationJob.perform_later("res_#{i}")
    end
  end
end
