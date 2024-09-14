# Event-Driven Microservices with RabbitMQ

## Description
This project implements an event-driven architecture using two microservices. One service (producer) sends messages to a RabbitMQ queue and another service (consumer) processes them.

## Services
1. **RabbitMQ**: Messaging service used for communication between microservices.
2. **Producer Service**: Microservice that generates an order and sends it to the RabbitMQ queue.
3. **Consumer Service**: Microservice that listens to the RabbitMQ queue and processes the orders.

## How to execute the project
### Requirements
- Docker
- Docker Compose

### Steps
1. Clone the repository.
2. Execute `docker-compose up --build` to raise all the services.
3. Access `http://localhost:5000/create_order` to create a new order.

### Accessing RabbitMQ
The RabbitMQ administration interface will be available at `http://localhost:15672` (user: `user`, password: `password`).

## Technologies
- Python
- Flask
- RabbitMQ
- Docker