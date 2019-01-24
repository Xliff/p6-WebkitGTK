use v6.c;

use NativeCall;

use GTK::Roles::Pointers;

unit package WebkitGTK::Raw::Types;

constant webkit is export = 'webkit2gtk-4.0',v37;
constant jsc    is export = 'javascriptcoregtk-4.0',v18;

class WebKitWebView             is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitDownload            is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitBackForwardList     is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebContext          is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitEditorState         is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitFindController      is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebInspector        is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebResource         is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebViewSessionState is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitSnapshotRegion      is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitSnapshotOptions     is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitUserContentManager  is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWebsiteDataManager  is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitWindowProperties    is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitBackForwardListItem is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitURIRequest          is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitSettings            is repr("CPointer") is export does GTK::Roles::Pointers { * }
class WebKitJavascriptResult    is repr("CPointer") is export does GTK::Roles::Pointers { * }

our enum WebKitSaveMode is export <
  SAVED
>;
