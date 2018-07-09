Shoryuken.sqs_client = Aws::SQS::Client.new

Shoryuken.configure_server do |config|
  config.server_middleware do |chain|
    chain.add ShoryukenMiddleware
  end
end