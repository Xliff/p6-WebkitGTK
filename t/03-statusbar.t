use v6.c;

use GTK::Application;
use GTK::Box;
use GTK::CSSProvider;
use GTK::Statusbar;
use WebkitGTK::HitTestResult;
use WebkitGTK::WebView;

my $a = GTK::Application.new(
  title => 'org.genex.p6-browser', width => 640, height => 480
);
my $c = GTK::CSSProvider.new( pod => $=pod );

my (%cids, $tc);
sub update_statusbar($s, $wv, $htr, $m, $ud) {
  state $last_s = 0;
  my $hit = WebkitGTK::HitTestResult.new($htr);

  if $hit.context_is_link {
    with $tc { $tc.cancel; $tc = Nil; }
    my $k = $hit.get_link_uri;
    $k = $k.substr(0, 63) ~ '…';
    %cids{$k} //= $last_s = $s.get_context_id($k);
    $s.push($last_s, $k);
  } else {
    $s.remove_all($last_s) with $last_s;
    $tc = $*SCHEDULER.cue({
      $s.remove_all($_) for %cids.values;
      %cids = (); $tc = Nil;
    }, in => 0.2);
  }
}

$a.activate.tap({
  my $s  = GTK::Statusbar.new;
  my $b  = GTK::Box.new-vbox;
  my $wv = WebkitGTK::WebView.new;

  $s.margins = 0;
  $wv.mouse-target-changed.tap(-> *@a { update_statusbar($s, |@a) });

  $b.pack_start($wv, True, True);
  $b.pack_end($s, False);
  $a.window.add($b);
  $a.window.title = 'Perl6 Browser';

  $wv.load_uri("http://slashdot.org/");
  $a.window.show_all;
});

$a.run;

=begin css
statusbar { font-size: 10px; }
=end css
