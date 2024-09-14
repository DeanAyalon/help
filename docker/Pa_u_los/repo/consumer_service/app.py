import pika
import time

# Retry logic for connecting to RabbitMQ
for _ in range(10):
    try:
        # 'rabbitmq' is the name of the service in Docker
        connection = pika.BlockingConnection(pika.ConnectionParameters(
            host = 'rabbitmq', 
            credentials = pika.PlainCredentials('user', 'password'))
        )
        break
    except pika.exceptions.AMQPConnectionError:
        print("Connection failed, retrying in 5 seconds...")
        time.sleep(5)
else:
    print("Failed to connect to RabbitMQ after several attempts.")
    exit(1)

channel = connection.channel()

# Ensure queue exists with quorum type
channel.queue_declare(queue='orders', arguments={'x-queue-type': 'quorum'})

# Callback function to process messages
def callback(ch, method, properties, body):
    print(f'Order received: {body}')
    # Here you can add the logic to process the order

# Consume the messages
channel.basic_consume(queue='orders', on_message_callback=callback, auto_ack=True)

print('Waiting for orders. Press CTRL+C to exit.')
channel.start_consuming()
