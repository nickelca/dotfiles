hook global BufCreate .*[.](adb|ads|gpr) %{
    set-option buffer filetype ada
}

hook -group ada-highlight global WinSetOption filetype=ada %{
    add-highlighter window/ada ref ada

    hook -once -always window WinSetOption filetype=.* %{
        remove-highlighter window/ada
    }
}

# Highlighters

add-highlighter shared/ada regions
add-highlighter shared/ada/code default-region group

add-highlighter shared/ada/comment region '--' '$' fill comment

add-highlighter shared/ada/string  region '"' (?<!\\)(\\\\)*" group
add-highlighter shared/ada/string/ fill string

# add-highlighter shared/ada/character  region "'" (?<!\\)(\\\\)*' group
# add-highlighter shared/ada/character/ fill string

add-highlighter shared/ada/code/ regex '\b(?:abort|abs|abstract|accept|access|aliased|all|and|array|at)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:begin|body)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:case|constant)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:declare|delay|delta|digits|do)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:else|elsif|end|entry|exception|exit)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:for|function)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:generic|goto)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:if|in|interface|is)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:limited|loop)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:mod)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:new|not|null)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:of|or|others|out|overriding)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:package|parallel|pragma|private|procedure|protected)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:raise|range|record|rem|renames|return|reverse|requeue|)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:select|separate|some|subtype|synchronized)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:tagged|task|terminate|then|type)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:until|use)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:when|while|with)\b' 0:keyword
add-highlighter shared/ada/code/ regex '\b(?:xor)\b' 0:keyword

add-highlighter shared/ada/code/ regex '\b(?:Integer|Character|String)\b' 0:type

add-highlighter shared/ada/code/ regex \b(?:true|false)\b 0:value
add-highlighter shared/ada/code/ regex \b(\d+(?:.\d+)?(?:[eE][+-]?\d+)?) 0:value
# add-highlighter shared/ada/code/values/octal regex \b0o[0-7]+ 0:value
# add-highlighter shared/ada/code/values/hex regex \b0x[0-9a-fA-F]+(?:[a-fA-F0-9]+(?:[pP][+-]?[0-9]+)?)? 0:value

add-highlighter shared/ada/code/ regex \'(?:Size|Succ|Pred|Val|Pos|First|Last|Length|Range)\b 0:attribute
