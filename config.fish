function exists
    set -gx CMD $argv[1]
    if type -q $CMD
        set -g CMDSTAT PRESENT
    else
        set -g CMDSTAT ABSENT
    end
end

if status is-interactive

exists oh-my-posh

if [ $CMDSTAT = "PRESENT" ]
	 oh-my-posh init fish --config ~/oh-my-posh/themes/gruvboxblood.omp.json | source
else
	echo "$CMD is missing or not installed!"
end

exists zoxide   

if [ $CMDSTAT = "PRESENT" ]
	zoxide init fish | source
else
        echo "$CMD is missing or not installed!"
end

end

abbr cd z
