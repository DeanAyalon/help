from flask import Flask, jsonify
import pika

app = Flask(__name__)

# Configure connection to RabbitMQ
def get_rabbitmq_channel():
    connection = pika.BlockingConnection(
        pika.ConnectionParameters(host='rabbitmq'))  # 'rabbitmq' is the name of the service in Docker
    channel = connection.channel()

    # Declare a quorum queue instead of a classic queue
    channel.queue_declare(queue='orders', arguments={'x-queue-type': 'quorum'})
    
    return channel

@app.route('/create_order', methods=['POST'])
def create_order():
    channel = get_rabbitmq_channel()

    # Simulated order message
    order_message = 'New order created'
    channel.basic_publish(exchange='',
                          routing_key='orders',
                          body=order_message)
    
    return jsonify({'message': 'Order created and sent to queue'}), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Run the app on port 5000