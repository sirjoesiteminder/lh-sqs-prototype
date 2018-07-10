namespace :reservation do
  desc "create new reservation jobs"

  task :create, [:count] => :environment do |t, args|
    args.with_defaults(count: 1)

    args[:count].to_i.times do |i|
      CreateReservationWorker.perform_async("res_#{i}")
    end
  end

  task :create_failed, [:count] => :environment do |t, args|
    args.with_defaults(count: 1)

    args[:count].to_i.times do |i|
      CreateFailedReservationWorker.perform_async("res_#{i}")
    end
  end
end
