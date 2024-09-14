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

add-highlighter shared/ada/code/ regex '(?i)\b(?:abort|abs|abstract|accept|access|aliased|all|and|array|at)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:begin|body)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:case|constant)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:declare|delay|delta|digits|do)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:else|elsif|end|entry|exception|exit)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:for|function)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:generic|goto)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:if|in|interface|is)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:limited|loop)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:mod)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:new|not|null)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:of|or|others|out|overriding)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:package|parallel|pragma|private|procedure|protected)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:raise|range|record|rem|renames|return|reverse|requeue|)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:select|separate|some|subtype|synchronized)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:tagged|task|terminate|then|type)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:until|use)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:when|while|with)\b' 0:keyword
add-highlighter shared/ada/code/ regex '(?i)\b(?:xor)\b' 0:keyword

add-highlighter shared/ada/code/ regex '(?i)\b(?:Integer|Character|String)\b' 0:type

add-highlighter shared/ada/code/ regex '(?i)\b(?:true|false)\b' 0:value
add-highlighter shared/ada/code/ regex '\b(\d+(?:.\d+)?(?:[eE][+-]?\d+)?)' 0:value

add-highlighter shared/ada/code/ regex "(?i)'(?:Size|Succ|Pred|Val|Pos|First|Last|Length|Range)\b" 0:attribute
