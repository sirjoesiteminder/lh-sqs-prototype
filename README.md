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