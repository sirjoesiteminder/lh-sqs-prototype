class ShoryukenMiddleware
  def call(worker_instance, queue, sqs_msg, body)
    puts "---------- Before processing SQS message using #{worker_instance.class.name} ----------"
    yield
    puts "---------- After processing SQS message using #{worker_instance.class.name} -----------"
  end
end