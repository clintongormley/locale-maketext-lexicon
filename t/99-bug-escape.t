#!/usr/bin/perl -w
use strict;
use Test::More tests => 8;

package Hello::I18N;
use Test::More;
use Tie::Hash;

use_ok(base => 'Locale::Maketext');
use_ok(
    'Locale::Maketext::Lexicon' => {
        en	=> ['Gettext'	=> \*::DATA],
    }
);

package main;

################################################################

ok(my $lh = Hello::I18N->get_handle('en'), 'Gettext - get_handle');

is(
    $lh->maketext('test-simple1'),
    '%',
    'escaped %%'
);
is(
    $lh->maketext('test-simple2'),
    '%',
    'escaped \\%'
);
is(
    $lh->maketext('test1'),
    'Hallo, Welt!10 pieces',
    'function %quant'
);
is(
    $lh->maketext('test2'),
    'Hallo, Welt!%quant(10,piece)',
    'escaped %quant by percent'
);
is(
    $lh->maketext('test3'),
    'Hallo, Welt!%quant(10,piece)',
    'escaped %quant by baack slash'
);


__DATA__
msgid ""
msgstr ""
"Project-Id-Version: Test App 0.01\n"
"POT-Creation-Date: 2002-05-02 11:36+0800\n"
"PO-Revision-Date: 2002-05-13 02:00+0800\n"
"Last-Translator: <cpan@audreyt.org>\n"
"Language-Team: German <cpan@audreyt.org>\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=ISO-8859-1\n"
"Content-Transfer-Encoding: 8bit\n"

msgid "test-simple1"
msgstr "%%"

msgid "test-simple2"
msgstr "\\%"

msgid "test1"
msgstr "Hallo, Welt!%quant(10,piece)"

msgid "test2"
msgstr "Hallo, Welt!%%quant(10,piece)"

msgid "test3"
msgstr "Hallo, Welt!\\%quant(10,piece)"


