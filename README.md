LittleHotelier - SQS Integration Prototype
==================

## Provision SQS queues

SQS queues are provisioned via Terraform script.

Create/update SQS queues
```
cd ./infra

terraform apply -auto-approve
```

Note:

Every qeueue provisioned should have an accompanying dead-letter queue to store unprocessible messages once their retry-limits have been reached.


## Application Setup
```
# initial setup
docker-compose up -d

# find process id for docker image 'lh-sqs-prototype_shoryuyken'
docker ps

# tail docker logs
docker logs --tail=10 -f <shoryugen sqs consumer process>
```



## Demo

Open a new terminal.

While on project root, run the following

```
docker-compose run app bundle exec rake reservation:create[NUMBER_OF_RESERVATIONS]
```

Once a rake task is fired, you expect to see logs populated in the other terminal.

As the provisioned queues are not of FIFO nature, therefore the messages are not processed by shoryuken processes in order.