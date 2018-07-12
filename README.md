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

Create reservations and report sync jobs

```
docker-compose run app bundle exec rake reservation:create[NUMBER_OF_RESERVATIONS]

# To create 10 reservations, do
docker-compose run app bundle exec rake reservation:create[10]
```

The above script creates reservations and corresponding report sync jobs. You expect to see logs populated in the other terminal.


Create reservation jobs that raise exceptions.

```
docker-compose run app bundle exec rake reservation:create_failed[NUMBER_OF_RESERVATIONS]
```

Expect to see retry logs. Once the retris have exhausted, failed jobs eventually are moved to the dead letter queue automatically.

Run the following rake task to view queue details

```
docker-compose run app bundle exec rake reservation:create_failed[NUMBER_OF_RESERVATIONS]
```

As the provisioned queues are not of FIFO nature, therefore the messages are not processed by shoryuken processes in order.