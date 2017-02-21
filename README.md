# NAME

Rex::Commands::Ubic - Blah blah blah

# SYNOPSIS

    use Rex::Commands::Ubic;

    desc "ubic config";
    task "ubic_config", sub {
        my $current_server = connection->server;
        my %server_config = (
            'ba0' => ['task1', 'task2'],
        );
        my @server_config = @{$server_config{$current_server}} or return;

        foreach my $service (@server_config) {
            file "/etc/ubic/service/$service.ini",
              source => "conf/ubic/$service.ini",
              on_change => sub {
                run "ubic restart $service";
                say "restart ubic $service";
              };
        }

        my $ret = run "ubic status";
        my @lines = split(/[\r\n]+/, $ret);
        foreach my $line (@lines) {
            my ($name, $status) = split(/\t+/, $line, 2);
            next if $name =~ /^\s*ubic/; # skip ubic itself
            next if grep { $name eq $_ } @server_config;
            say "# try remove $name";
            if ($status =~ /running/) {
                run "ubic stop $name";
            }
            say "rm /etc/ubic/service/$name.ini";
            run "rm /etc/ubic/service/$name.ini";
        }

    };

# DESCRIPTION

Rex::Commands::Ubic is

# AUTHOR

Fayland Lam <fayland@gmail.com>

# COPYRIGHT

Copyright 2017- Fayland Lam

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
