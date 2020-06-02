/* Strategy provided by p6-XML-LibXML:author<FROGGS> */
#ifdef _WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif

#include <webkit2/webkit-web-extension.h>

#define s(name)     DLLEXPORT int sizeof_ ## name () { return sizeof(name); }

s(WebKitFrame)
s(WebKitFrameClass)
s(WebKitScriptWorld)
s(WebKitScriptWorldClass)
s(WebKitWebEditor)
s(WebKitWebEditorClass)
s(WebKitWebExtension)
s(WebKitWebExtensionClass)
s(WebKitWebHitTestResult)
s(WebKitWebHitTestResultClass)
s(WebKitWebPage)
s(WebKitWebPageClass)
