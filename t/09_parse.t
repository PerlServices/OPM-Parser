#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use OPM::Parser;

use File::Basename;
use File::Spec;

{
    my $opm_file = File::Spec->catfile( dirname(__FILE__), 'data', 'NotThere-3.3.2.opm' );
    my $opm      = OPM::Parser->new( opm_file => $opm_file );

    isa_ok $opm, 'OPM::Parser';

    my $success = $opm->parse;

    ok !$success, 'File NotThere-3.3.2.opm does not exist';
    is $opm->error_string, 'File does not exist';
}


{
    my $opm_file = File::Spec->catfile( dirname(__FILE__), 'data', 'QuickMergeTwoDocs-3.3.2.opm' );
    my $opm      = OPM::Parser->new( opm_file => $opm_file );

    isa_ok $opm, 'OPM::Parser';

    my $success = $opm->parse;

    my $found = grep{ $_->{filename} eq 'doc/en/QuickMerge.anything' }@{ $opm->files };
    ok !$found;

    my $sopm = $opm->as_sopm;
    ok $sopm;
}

{
    my $opm_file = File::Spec->catfile( dirname(__FILE__), 'data', 'QuickMerge-4.0.3.opm' );
    my $opm      = OPM::Parser->new( opm_file => $opm_file );

    isa_ok $opm, 'OPM::Parser';

    my $success = $opm->parse;
    ok $success;
    is $opm->error_string, '';
}


done_testing();

