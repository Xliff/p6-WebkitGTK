use v6.c;

use GLib::Raw::Definitions;

unit package WebkitGTK::JavaScript::Raw::Enums;

constant JSCCheckSyntaxMode is export := guint32;
our enum JSCCheckSyntaxModeEnum is export <
    JSC_CHECK_SYNTAX_MODE_SCRIPT
    JSC_CHECK_SYNTAX_MODE_MODULE
>;

constant JSCCheckSyntaxResult is export := guint32;
our enum JSCCheckSyntaxResultEnum is export <
    JSC_CHECK_SYNTAX_RESULT_SUCCESS
    JSC_CHECK_SYNTAX_RESULT_RECOVERABLE_ERROR
    JSC_CHECK_SYNTAX_RESULT_IRRECOVERABLE_ERROR
    JSC_CHECK_SYNTAX_RESULT_UNTERMINATED_LITERAL_ERROR
    JSC_CHECK_SYNTAX_RESULT_OUT_OF_MEMORY_ERROR
    JSC_CHECK_SYNTAX_RESULT_STACK_OVERFLOW_ERROR
>;

constant JSCOptionType is export := guint32;
our enum JSCOptionTypeEnum is export <
    JSC_OPTION_BOOLEAN
    JSC_OPTION_INT
    JSC_OPTION_UINT
    JSC_OPTION_SIZE
    JSC_OPTION_DOUBLE
    JSC_OPTION_STRING
    JSC_OPTION_RANGE_STRING
>;

constant JSCValuePropertyFlags is export := guint32;
our enum JSCValuePropertyFlagsEnum is export (
    JSC_VALUE_PROPERTY_CONFIGURABLE =>  1 +< 0,
    JSC_VALUE_PROPERTY_ENUMERABLE =>  1 +< 1,
    JSC_VALUE_PROPERTY_WRITABLE =>  1 +< 2,
);
