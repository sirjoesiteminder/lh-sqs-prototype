LittleHotelier - SQS Integration Prototype
==================

## Provision SQS queues

SQS queues are provisioned via Terraform script.

Create/update SQS queues
```
cd ./infra

terraform apply -auto-approve






```

Every qeueue provisioned should have an accompanying dead-letter queue to store unprocessible messages once their retry-limits have been reached.

