// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:pusher_client/pusher_client.dart';

// class PusherService {
//   PusherClient? pusher;
//   late Channel channel;

//   PusherService() {
//     pusher = PusherClient(
//       '70d9e9c31892b4d0bb4b', // Pusher key
//       PusherOptions(
//         cluster: 'ap1', // Pusher cluster
//         encrypted: true,
//       ),
//       autoConnect: false,
//     );

//     pusher?.connect();
//     channel = pusher!.subscribe('chat-channel');

//     channel.bind('chat-send', (event) {
//       // Handle incoming message
//       print(event?.data);
//     });
//   }
// }
