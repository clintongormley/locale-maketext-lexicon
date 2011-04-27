#!perl

use 5.005;
use inc::Module::Install;

author 'Audrey Tang <cpan@audreyt.org>';
abstract 'Use other catalog formats in Maketext';
name 'Locale-Maketext-Lexicon';
license 'MIT';
perl_version '5.005';
all_from 'lib/Locale/Maketext/Lexicon.pm';
install_script 'script/xgettext.pl';
requires 'Locale::Maketext'       => '1.17';
requires 'Class::Load'            => '0.06';
recommends 'Template'             => '2.20';
recommends 'Template::Constants'  => '2.75';
recommends 'YAML'                 => '0.66';
recommends 'YAML::Loader'         => '0.66';
recommends 'HTML::Parser'         => '3.56';
recommends 'Lingua::EN::Sentence' => '0.25';
recommends 'PPI'                  => '1.203';

test_requires 'Test::More'        => '0';
if ( $^O eq 'MSWin32' ) {
    recommends 'Win32::Console' => '0.09';
}
include_deps 'Test::More';

WriteAll;
