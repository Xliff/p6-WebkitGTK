use v6.c;

use WebkitGTK::Raw::Types;

use GTK::Application;
use WebkitGTK::WebView;
use WebkitGTK::JavaScript::Context;

my $a = GTK::Application.new(
  title => 'org.genex.p6-browser', width => 640, height => 480
);

sub print_story_title($o, $r, $ud, $wv) {
  my $js_result = $wv.run_javascript_finish($r);
  without $js_result {
    say "Error running javascript: { $ERROR.message }" with $ERROR;
    return;
  }

  my $val = $js_result.get_js_value;
  if $val && $val.is_string {
    my $s = $val.to_string;
    my $e = WebkitGTK::JavaScript::Context.new(
      $val.get_context(:raw)
    ).get_exception;
    with $e {
      say "Error running javascript: { $e.get_message }";
    } else {
      say "First story title is: { $s }";
    }
  } else {
    say 'Error running javascript: unexpected return value';
  }
}

sub get_story_title($wv) {
  $wv.run_javascript(
    '$("header span.story-title a")[0].innerText;',
    -> *@a {
      CATCH { default { .message.say } }
      print_story_title(|@a, $wv)
    },
  );
}

$a.activate.tap({
  my $wv = WebkitGTK::WebView.new;

  # A lot more work when integrating with JavaScript.
  $wv.load-changed.tap(-> *@a {
    get_story_title($wv) if @a[1] == WEBKIT_LOAD_FINISHED;
  });

  $wv.load_uri("http://slashdot.org/");
  $a.window.add($wv);
  $a.window.title = 'Perl6 Browser';
  $a.window.show_all;
});

$a.run;
