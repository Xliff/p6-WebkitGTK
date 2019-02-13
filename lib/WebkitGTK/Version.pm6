use v6.c;

use WebkitGTK::Raw::Version;

class WebkitGTK::Version {

  method new (|c) {
    die 'WebkitGTK::Version is not an instantiable class.'
  }

  method minor {
    webkit_get_minor_version();
  }

  method major {
    webkit_get_major_version();
  }

  method micro {
    webkit_get_micro_version();
  }

  method Version {
    Version.new(~self.substr(1));
  }

  method Int {
    self.major.Int + (self.minor.Int / 1000) + (self.micro / 1e6)
  }

  method Str {
    'v' ~ (
      self.major, self.minor.fmt('%02d'), self.micro.fmt('%03d')
    ).join('.');
  }
}
