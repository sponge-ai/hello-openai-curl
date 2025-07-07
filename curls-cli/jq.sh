# "${@:2}" -> all args from pos 2
# .output[] -> iterates over output
zsh $1 "${@:2}" | jq '
    .output[]
    | select(.type == "message") 
    | .content[]
    | .text
'