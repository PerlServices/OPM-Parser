[![Kwalitee status](https://cpants.cpanauthors.org/dist/OPM-Parser.png)](https://cpants.cpanauthors.org/dist/OPM-Parser)
[![GitHub issues](https://img.shields.io/github/issues/perlservices/OPM-Parser.svg)](https://github.com/perlservices/OPM-Parser/issues)
[![CPAN Cover Status](https://cpancoverbadge.perl-services.de/OPM-Parser-1.06)](https://cpancoverbadge.perl-services.de/OPM-Parser-1.06)
[![Cpan license](https://img.shields.io/cpan/l/OPM-Parser.svg)](https://metacpan.org/release/OPM-Parser)

# NAME

OPM::Parser - Parser for the .opm file

# VERSION

version 1.06

# SYNOPSIS

```perl
use OPM::Parser;

my $opm_file = 'QuickMerge-3.3.2.opm';
my $opm      = OPM::Parser->new( opm_file => $opm_file );
$opm->parse or die "OPM parse failed: ", $opm->error_string;

say sprintf "This is version %s of package %s",
    $opm->version,
    $opm->name;

say "You can install it on those framework versions: ", join ", ", @{ $opm->framework };

say "Dependencies: ";
for my $dep ( @{ $opm->dependencies } ) {
    say sprintf "%s (%s) - (%s)", 
        $dep->{name},
        $dep->{version},
        $dep->{type};
}
```

# METHODS

## new

## parse

Validates and parses the _.opm_ file. It returns `1` on success and `undef` on error.
If an error occurs, one can get the error message with `error_string`:

```perl
my $opm_file = 'QuickMerge-3.3.2.opm';
my $opm      = OPM::Parser->new( opm_file => $opm_file );
$opm->parse or die "OPM parse failed: ", $opm->error_string;
```

If you want to ignore validation result, you can pass `ignore_validation => 1`:

```perl
my $opm_file = 'QuickMerge-3.3.2.opm';
my $opm      = OPM::Parser->new( opm_file => $opm_file );
$opm->parse( ignore_validation => 1 )
    or die "OPM parse failed: ", $opm->error_string;
```

## as\_sopm

## documentation

## validate

# ATTRIBUTES

- opm\_file
- tree
- framework
- dependencies
- files
- error\_string
- description
- license
- url
- vendor
- version
- name



# Development

The distribution is contained in a Git repository, so simply clone the
repository

```
$ git clone git://github.com/perlservices/OPM-Parser.git
```

and change into the newly-created directory.

```
$ cd OPM-Parser
```

The project uses [`Dist::Zilla`](https://metacpan.org/pod/Dist::Zilla) to
build the distribution, hence this will need to be installed before
continuing:

```
$ cpanm Dist::Zilla
```

To install the required prequisite packages, run the following set of
commands:

```
$ dzil authordeps --missing | cpanm
$ dzil listdeps --author --missing | cpanm
```

The distribution can be tested like so:

```
$ dzil test
```

To run the full set of tests (including author and release-process tests),
add the `--author` and `--release` options:

```
$ dzil test --author --release
```

# AUTHOR

Renee Baecker <reneeb@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2016 by Renee Baecker.

This is free software, licensed under:

```
The Artistic License 2.0 (GPL Compatible)
```
