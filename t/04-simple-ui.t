use v6.c;

use GTK::Application;
use GTK::Builder;
use WebkitGTK::Raw::Types;
use WebkitGTK::HitTestResult;
use WebkitGTK::WebView;

my $a = GTK::Application.new( title => 'org.genex.p6-browser' );
my $b = GTK::Builder.new( pod => $=pod );
my $wv = WebkitGTK::WebView.new;

my (%cids, $tc, $last_s);
sub update_statusbar($s, $wv, $htr, $m, $ud) {
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

sub load {
  $wv.load_uri( $b<URIEntry>.text );
}

sub stop {
  $wv.stop_loading if $wv.is_loading;
}

sub fwd {
  $wv.go_forward if $wv.can_go_forward;
  $b<Fwd>.sensitive = $wv.can_go_forward;
  $b<Back>.sensitive = $wv.can_go_back;
};

sub back {
  $wv.go_back if $wv.can_go_back;
  $b<Back>.sensitive = $wv.can_go_back;
  $b<Fwd>.sensitive = $wv.can_go_forward;
}

sub handle_loading($s, *@a) {
  given @a[1] {
    when WEBKIT_LOAD_STARTED    {
      my $uri = $wv.get_uri;
      my $text = "Loading { $uri }……";
      $last_s = %cids{$uri} = $s.get_context_id($text);
      $s.push($last_s, $text);
    }
    when WEBKIT_LOAD_REDIRECTED { }
    when WEBKIT_LOAD_COMMITTED  { }
    when WEBKIT_LOAD_FINISHED   {
      $s.pop($last_s);
      $last_s = Nil;
      %cids{$_}:delete for %cids.keys;
      $b<Back>.sensitive = $wv.can_go_back;
    }
  }
}

$a.activate.tap({
  my $s  = GTK::Statusbar.new;

  $b<Back>.sensitive = $b<Fwd>.sensitive = False;
  $s.margins = 0;
  $wv.mouse-target-changed.tap(-> *@a { update_statusbar($s, |@a) });
  $wv.load-changed.tap(        -> *@a {   handle_loading($s, |@a) });

  $b<MainWin>.destroy-signal.tap({ $a.exit });

  $b<URIEntry>.activate.tap({ load() });
  $b<Back>.clicked.tap(     { back() });
  $b<Fwd>.clicked.tap(      { fwd()  });
  $b<Stop>.clicked.tap(     { stop() });

  $b<MainWin>.set_size_request(640, 480);
  $b<MainWinBox>.pack_start($wv, True, True);
  $b<MainWinBox>.pack_end($s, False);
  $b<MainWin>.title = 'Perl6 Browser';
  $b<MainWin>.show_all;
});

$a.run;

=begin css
statusbar { font-size: 10px; }
=end css

=begin ui
<?xml version="1.0" encoding="UTF-8"?>
<!-- Generated with glade 3.22.1 -->
<interface>
  <requires lib="gtk+" version="3.20"/>
  <object class="GtkWindow" id="MainWin">
    <property name="can_focus">False</property>
    <child>
      <placeholder/>
    </child>
    <child>
      <object class="GtkBox" id="MainWinBox">
        <property name="visible">True</property>
        <property name="can_focus">False</property>
        <property name="margin_bottom">2</property>
        <property name="orientation">vertical</property>
        <child>
          <object class="GtkBox">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <child>
              <object class="GtkBox">
                <property name="visible">True</property>
                <property name="can_focus">False</property>
                <property name="orientation">vertical</property>
                <child>
                  <object class="GtkEntry" id="URIEntry">
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                  </object>
                  <packing>
                    <property name="expand">False</property>
                    <property name="fill">True</property>
                    <property name="position">0</property>
                  </packing>
                </child>
                <child>
                  <placeholder/>
                </child>
              </object>
              <packing>
                <property name="expand">True</property>
                <property name="fill">True</property>
                <property name="position">0</property>
              </packing>
            </child>
            <child>
              <object class="GtkButtonBox">
                <property name="visible">True</property>
                <property name="can_focus">False</property>
                <property name="layout_style">start</property>
                <child>
                  <object class="GtkButton" id="Stop">
                    <property name="label">gtk-stop</property>
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                    <property name="receives_default">True</property>
                    <property name="use_stock">True</property>
                    <property name="image_position">top</property>
                  </object>
                  <packing>
                    <property name="expand">True</property>
                    <property name="fill">True</property>
                    <property name="position">0</property>
                  </packing>
                </child>
                <child>
                  <object class="GtkButton" id="Back">
                    <property name="label">gtk-go-back</property>
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                    <property name="receives_default">True</property>
                    <property name="use_stock">True</property>
                    <property name="image_position">top</property>
                  </object>
                  <packing>
                    <property name="expand">True</property>
                    <property name="fill">True</property>
                    <property name="position">1</property>
                  </packing>
                </child>
                <child>
                  <object class="GtkButton" id="Fwd">
                    <property name="label">gtk-go-forward</property>
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                    <property name="receives_default">True</property>
                    <property name="use_stock">True</property>
                    <property name="image_position">top</property>
                  </object>
                  <packing>
                    <property name="expand">True</property>
                    <property name="fill">True</property>
                    <property name="position">2</property>
                  </packing>
                </child>
                <child>
                  <object class="GtkButton" id="Home">
                    <property name="label">gtk-home</property>
                    <property name="visible">True</property>
                    <property name="can_focus">True</property>
                    <property name="receives_default">True</property>
                    <property name="use_stock">True</property>
                    <property name="image_position">top</property>
                  </object>
                  <packing>
                    <property name="expand">True</property>
                    <property name="fill">True</property>
                    <property name="position">3</property>
                  </packing>
                </child>
              </object>
              <packing>
                <property name="expand">False</property>
                <property name="fill">True</property>
                <property name="position">1</property>
              </packing>
            </child>
          </object>
          <packing>
            <property name="expand">False</property>
            <property name="fill">True</property>
            <property name="position">0</property>
          </packing>
        </child>
        <child>
          <placeholder/>
        </child>
        <child>
          <placeholder/>
        </child>
      </object>
    </child>
  </object>
</interface>
=end ui
