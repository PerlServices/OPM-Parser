package OPM::Parser::Types;

# ABSTRACT: types for OPM::Parser

use v5.24;

use strict;
use warnings;

# VERSION

use Type::Library
   -base,
;

use Type::Utils -all;
use Types::Standard -types;

Type::Utils::extends('Types::Standard');

declare VersionString =>
    as Str,
    where {
        $_ =~ m{ \A (?:[0-9]+) (?:\.[0-9]+){0,2} (?:_\d+)? \z }xms
    };

declare FrameworkVersionString =>
    as Str,
    where {
        $_ =~ m{ \A (?: (?:x|[0-9]+x?) \. ){1,2} (?: x | [0-9]+x? ) \z }xms
    };

declare XMLTree =>
    as InstanceOf['XML::LibXML::Document'];


1;
