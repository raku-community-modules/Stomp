[![Actions Status](https://github.com/raku-community-modules/Stomp/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/Stomp/actions) [![Actions Status](https://github.com/raku-community-modules/Stomp/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/Stomp/actions) [![Actions Status](https://github.com/raku-community-modules/Stomp/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/Stomp/actions)

NAME
====

Stomp - basic Simple Text Orientated Messaging Protocol implementation

SYNOPSIS
========

```raku
use Stomp::Client;

my $client = Stomp::Client.new(:$login, :$password, :$port, :$host);
await $client.connect;

# receiving
react {
    whenever $client.subscribe($queue) -> $v {
        say "Got : ",$v.body;
    }
}

# sending
$client.send($queue, $message);
```

DESCRIPTION
===========

The `Stomp` distribution provides basic support for [Stomp (aka Simple Text Oriented Message Protocol)](https://stomp.github.io) for both client and server roles.

CLASSES
=======

Stomp::Client
-------------

```raku
my $client = Stomp::Client.new(:$login, :$password, :$port, :$host);
await $client.connect;
```

### subscribe

```raku
react {
    whenever $client.subscribe($queue) -> $v {
        say "Got : ",$v.body;
    }
}
```

The `subscribe` method expects the name of the STOMP queue to receive messages from. It returns a `Supply`.

### send

```raku
$client.send($queue, $message, :$content-type);
```

The `send` method will send the given message to the indicated queue. An optional named argument `:content-type` can be specified with a MIME-type. The default is `text/plain`.

Stomp::Server
-------------

```raku
use Stomp::Server;

my $server = Stomp::Server.new(:$host, :$port);

react {
    whenever $server.listen -> $message {
        # ...
    }
}
```

UPDATE NOTES
============

This module was never released as a public module before being released as a Raku Community module. It lacks more documentation and definitely some TLC. Caretakers are very welcome, as are any Pull Requests to make this a better distribution.

AUTHOR
======

Jonathan Worthington

Source can be located at: https://github.com/raku-community-modules/Stomp . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2016 - 2017 Jonathan Worthington

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

