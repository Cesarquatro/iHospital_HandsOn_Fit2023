import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ihospital/pedir.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

/// A QOS1 publishing example, two QOS one topics are subscribed to and published in quick succession,
/// tests QOS1 protocol handling when manual acknowledgement is in force.
Future<int> MQTT_pub(String myWillMessage) async {
  final client = MqttServerClient('test.mosquitto.org', '');

  /// Set the correct MQTT protocol for mosquito
  client.setProtocolV311();
  client.logging(on: false);
  client.keepAlivePeriod = 20;
  client.onDisconnected = onDisconnected;
  client.onSubscribed = onSubscribed;
  client.manuallyAcknowledgeQos1 = true;
  final connMess = MqttConnectMessage()
      .withClientIdentifier('Mqtt_MyClientUniqueIdQ1')
      .withWillTopic('iHospital') // If you set this you must set a will message
      .withWillMessage(myWillMessage)
      .startClean() // Non persistent session for testing
      .withWillQos(MqttQos.atLeastOnce);
  print('EXAMPLE::Mosquitto client connecting....');
  client.connectionMessage = connMess;

  try {
    await client.connect();
  } on Exception catch (e) {
    print('EXAMPLE::client exception - $e');
    client.disconnect();
  }

  /// Check we are connected
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('EXAMPLE::Mosquitto client connected');
  } else {
    print(
        'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
    client.disconnect();
    exit(-1);
  }

  /// Lets try our subscriptions
  print('EXAMPLE:: <<<< SUBSCRIBE 1 >>>>');
  const topic1 = 'iHospital'; // Not a wildcard topic
  client.subscribe(topic1, MqttQos.atMostOnce);

  try {
    client.updates!.listen((messageList) {
      final recMess = messageList[0];
      if (recMess is! MqttReceivedMessage<MqttPublishMessage>) return;
      final pubMess = recMess.payload;
      final pt =
          MqttPublishPayload.bytesToStringAsString(pubMess.payload.message);
      print(
          'EXAMPLE::Change notification:: topic is <${recMess.topic}>, payload is <-- $pt -->');
      // Perform any required business logic processing before manually acknowledging
      // the message. You don't have to check anything about the publish message, the
      // acknowledgeQos1Message method will only send an acknowledge for the publish message
      // if it is Qos 1, manual acknowledge has been selected and there is an acknowledge outstanding.
      // If you need to know the acknowledge has been sent the return code will be true.
      print(
          'EXAMPLE::Manually Acknowledging message id ${pubMess.variableHeader?.messageIdentifier}');
      final ackRes = client.acknowledgeQos1Message(pubMess);
      ackRes!
          ? print('EXAMPLE::Manual acknowledge succeeded')
          : print('EXAMPLE::No Manual acknowledge');
      print(
          'EXAMPLE::Outstanding manual acknowledge message count is ${client.messagesAwaitingManualAcknowledge}');
    });
  } catch (e, s) {
    print(s);
  }

  /// If needed you can listen for published messages that have completed the publishing
  /// handshake which is Qos dependant. Any message received on this stream has completed its
  /// publishing handshake with the broker unless the message is a Qos 1 message and manual
  /// acknowledge has been set on the client, in which case the user must manually acknowledge the
  /// received publish message on completion of any business logic processing.
  client.published!.listen((MqttPublishMessage message) {
    print(
        'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
    /*if (message.variableHeader!.topicName == topic3) {
      print('EXAMPLE:: Non subscribed topic received.');
    }*/
  });

  /*final builder1 = MqttClientPayloadBuilder();
  builder1.addString('Hello from mqtt_client topic 1');
  print('EXAMPLE:: <<<< PUBLISH 1 >>>>');
  client.publishMessage(topic1, MqttQos.atLeastOnce, builder1.payload!);*/

  print('EXAMPLE::Sleeping....');
  await MqttUtilities.asyncSleep(60);

  print('EXAMPLE::Unsubscribing');
  client.unsubscribe(topic1);

  await MqttUtilities.asyncSleep(10);
  print('EXAMPLE::Disconnecting');
  client.disconnect();
  return 0;
}

/// The subscribed callback
void onSubscribed(String topic) {
  print('EXAMPLE::Subscription confirmed for topic $topic');
}

/// The unsolicited disconnect callback
void onDisconnected() {
  print('EXAMPLE::OnDisconnected client callback - Client disconnection');
}

//view:
class mqttOn extends StatefulWidget {
  const mqttOn({super.key});

  @override
  State<mqttOn> createState() => _mqttOnState();
}

class _mqttOnState extends State<mqttOn> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 480,
        width: 280,
        decoration: BoxDecoration(
          color: Color.fromARGB(225, 41, 37, 86),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(15)),
            Text(
              "LigarMQTT",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Switch(
              value: status,
              onChanged: (value) {
                status = value;
                setState(() {
                  conectar();
                });
              },
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              height: 320,
              width: 240,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  valor,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final client = MqttServerClient('test.mosquitto.org', '');

  var pongCount = 0; // Pong counter

  Future<int> conectar() async {
    /// A websocket URL must start with ws:// or wss:// or Dart will throw an exception, consult your websocket MQTT broker
    /// for details.
    /// To use websockets add the following lines -:
    /// client.useWebSocket = true;
    /// client.port = 80;  ( or whatever your WS port is)
    /// There is also an alternate websocket implementation for specialist use, see useAlternateWebSocketImplementation
    /// Note do not set the secure flag if you are using wss, the secure flags is for TCP sockets only.
    /// You can also supply your own websocket protocol list or disable this feature using the websocketProtocols
    /// setter, read the API docs for further details here, the vast majority of brokers will support the client default
    /// list so in most cases you can ignore this.
    /// Set logging on if needed, defaults to off
    client.logging(on: true);

    /// Set the correct MQTT protocol for mosquito
    client.setProtocolV311();

    /// If you intend to use a keep alive you must set it here otherwise keep alive will be disabled.
    client.keepAlivePeriod = 20;

    /// The connection timeout period can be set if needed, the default is 5 seconds.
    client.connectTimeoutPeriod = 2000; // milliseconds

    /// Add the unsolicited disconnection callback
    client.onDisconnected = onDisconnected;

    /// Add the successful connection callback
    client.onConnected = onConnected;

    /// Add a subscribed callback, there is also an unsubscribed callback if you need it.
    /// You can add these before connection or change them dynamically after connection if
    /// you wish. There is also an onSubscribeFail callback for failed subscriptions, these
    /// can fail either because you have tried to subscribe to an invalid topic or the broker
    /// rejects the subscribe request.
    client.onSubscribed = onSubscribed;

    /// Set a ping received callback if needed, called whenever a ping response(pong) is received
    /// from the broker.
    client.pongCallback = pong;

    /// Create a connection message to use or use the default one. The default one sets the
    /// client identifier, any supplied username/password and clean session,
    /// an example of a specific one below.
    final connMess = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueId')
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('EXAMPLE::Mosquitto client connecting....');
    client.connectionMessage = connMess;

    /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
    /// in some circumstances the broker will just disconnect us, see the spec about this, we however will
    /// never send malformed messages.
    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      print('EXAMPLE::socket exception - $e');
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('EXAMPLE::Mosquitto client connected');
    } else {
      /// Use status here rather than state if you also want the broker return code.
      print(
          'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }

    /// Ok, lets try a subscription
    print('EXAMPLE::Subscribing to the test/lol topic');
    const topic = 'iHospital'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      valor = pt;
      setState(() {});

      /// The above may seem a little convoluted for users only interested in the
      /// payload, some users however may be interested in the received publish message,
      /// lets not constrain ourselves yet until the package has been in the wild
      /// for a while.
      /// The payload is a byte buffer, this will be specific to the topic
      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });

    /// If needed you can listen for published messages that have completed the publishing
    /// handshake which is Qos dependant. Any message received on this stream has completed its
    /// publishing handshake with the broker.
    client.published!.listen((MqttPublishMessage message) {
      print(
          'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
    });

    /// Lets publish to our topic
    /// Use the payload builder rather than a raw buffer
    /// Our known topic to publish to
    const pubTopic = 'Dart/Mqtt_client/testtopic';
    final builder = MqttClientPayloadBuilder();
    builder.addString('Hello from mqtt_client');

    /// Subscribe to it
    print('EXAMPLE::Subscribing to the Dart/Mqtt_client/testtopic topic');
    client.subscribe(pubTopic, MqttQos.exactlyOnce);

    /// Publish it
    print('EXAMPLE::Publishing our topic');
    client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);

    /// Ok, we will now sleep a while, in this gap you will see ping request/response
    /// messages being exchanged by the keep alive mechanism.
    print('EXAMPLE::Sleeping....');
    await MqttUtilities.asyncSleep(60);

    /// Finally, unsubscribe and exit gracefully
    print('EXAMPLE::Unsubscribing');
    client.unsubscribe(topic);

    /// Wait for the unsubscribe message from the broker if you wish.
    await MqttUtilities.asyncSleep(2);
    print('EXAMPLE::Disconnecting');
    client.disconnect();
    print('EXAMPLE::Exiting normally');
    return 0;
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    } else {
      print(
          'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
      exit(-1);
    }
    if (pongCount == 3) {
      print('EXAMPLE:: Pong count is correct');
    } else {
      print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
    }
  }

  /// The successful connect callback
  void onConnected() {
    print(
        'EXAMPLE::OnConnected client callback - Client connection was successful');
  }

  /// Pong callback
  void pong() {
    print('EXAMPLE::Ping response client callback invoked');
    pongCount++;
  }
}
