class ShoryukenMiddleware
  def call(worker_instance, queue, sqs_msg, body)
    puts '---------- Before processing SQS message ----------'
    yield
    puts '---------- After processing SQS message -----------'
  end
end