use v6.c;

use WebkitGTK::Raw::Types;

use DOM::Tiny;

use GTK::Application;
use WebkitGTK::WebView;

my $a = GTK::Application.new(
  title => 'org.genex.p6-browser', width => 640, height => 480
);

my @completed = <
  .reportSection
  .sectionBody
  #rating
  .rating_g
  span
>;

$a.activate.tap( -> *@q {
  my $wv = WebkitGTK::WebView.new;
  #$wv.load_uri("http://slashdot.org/");
  $wv.load_uri("https://www.ssllabs.com/ssltest/analyze.html?d=www.thebizzellgroup.com");
  $a.window.add($wv);
  $a.window.title = 'Perl6 Browser';
  $a.window.show_all;

  $wv.load-changed.tap( -> *@a {
    CATCH {
      default { .message.say; .backtrace.concise.say }
    }

    given @a[1] {
      when WEBKIT_LOAD_FINISHED {
        my $r = $wv.get-main-resource;
        say 'Getting resource...';
        $r.get-data(-> $s1, $s2, $s3, $s4 {
          CATCH {
            default { .message.say; .backtrace.concise.say }
          }

          say 'Getting data...';
          my $html = $r.get-data-finish( $s2, :str ).head;
          my $d = DOM::Tiny.parse($html); 
          my @i = @completed;
          while @i.shift -> $s {
            if $d.find($s) -> $nd {
              $d = $nd;
              next;
            }
            last;
          }
          if +@i {
            say 'Not completed';
          } else {
            say 'Completed';
            # cw: Perform completed actions.
          }
        });
      }
    }
  })
});

$a.run;
