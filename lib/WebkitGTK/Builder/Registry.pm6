use v6.c;

class WebkitGTK::Builder::Registry {

  method register (WebkitGTK::Builder::Registry:U: ) {
    %(
      'PREFIX'          => 'WebKit',
      'WEBKIT::WebView' => 'WebkitGTK::View'
    );
  }
  
}
