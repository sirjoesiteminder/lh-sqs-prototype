require 'pry'

namespace :sqs do
  desc "query sqs queues"

  task :get_queue_attributes, [:queue_name] => :environment do |t, args|
    
    return puts "A queue name needs to be provided" if args[:queue_name].nil?

    sqs = Aws::SQS::Client.new
  

    queue_url = sqs.get_queue_url({ queue_name: args[:queue_name].strip }).queue_url

    puts "queue_url: #{queue_url}"

    response = sqs.get_queue_attributes({
      queue_url: queue_url,
      attribute_names: [
        "VisibilityTimeout",
        "MaximumMessageSize",
        "MessageRetentionPeriod",
        "ApproximateNumberOfMessages",
        "ApproximateNumberOfMessagesNotVisible",
        "ReceiveMessageWaitTimeSeconds"
      ]
    })

    puts response.attributes.to_json.to_s
  end
end