use Stomp::Client;
use Stomp::Server;

class Stomp {
    my class Client  is Stomp::Client  is export { }
    my class Message is Stomp::Message is export { }
    my class Parser  is Stomp::Parser  is export { }
    my class Server  is Stomp::Server  is export { }
}
