package Rex::Commands::Ubic;

use strict;
use warnings;

our $VERSION = '0.01';

require Rex::Exporter;
use base qw(Rex::Exporter);
use vars qw(@EXPORT);
use Carp;

use Rex::Logger;
use Rex::Commands;
use Rex::Commands::Run;
use Rex::Commands::Fs;
use Rex::Commands::File;

# rexify --use Rex::Misc::ShellBlock
# use Rex::Misc::ShellBlock;
# use JSON;

@EXPORT = qw(ubic ubic_status ubic_service);

sub ubic_status {
    my $ret = run "ubic status";
    my @lines = split(/[\r\n]+/, $ret);
}

# sub ubic_status {
#     my $data = shell_block <<'CODE';
# #!/usr/bin/env perl

# use strict;
# use warnings;
# use JSON;
# use Ubic;

# CODE
# }

sub ubic_service {
    my ($name, %opts) = @_;


}


1;
__END__

=encoding utf-8

=head1 NAME

Rex::Commands::Ubic - Rex joins Ubic

=head1 SYNOPSIS

  use Rex::Commands::Ubic;

=head1 NOTE

Do

    rexify --use Rex::Misc::ShellBlock

to install the requirement first

=head1 DESCRIPTION

Rex::Commands::Ubic is

=head1 AUTHOR

Fayland Lam E<lt>fayland@gmail.comE<gt>

=head1 COPYRIGHT

Copyright 2017- Fayland Lam

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=cut
