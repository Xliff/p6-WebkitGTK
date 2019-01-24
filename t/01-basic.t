use v6.c;

use GTK::Application;
use WebkitGTK::WebView;

my $a = GTK::Application.new(
  title => 'org.genex.p6-browser', width => 640, height => 480
);

$a.activate.tap({
  my $wv = WebkitGTK::WebView.new;
  $wv.load_uri("http://slashdot.org/");
  $a.window.add($wv);
  $a.window.title = 'Perl6 Browser';
  $a.window.show_all;
});

$a.run;
