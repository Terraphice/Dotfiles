function zf
    set -l cmd $argv[1]
    set -l found 0
    set -l args

    for arg in $argv[2..-1]
        if string match -rq -- - $arg
            set args $args $arg
        else if test -f $arg
            set args $args $arg
        else
            for dir in (zoxide query -l)
                set -l matching_file (fd --max-depth 1 --type f "$arg*" $dir | head -n 1)
                if test -n "$matching_file"
                    set args $args $matching_file
                    set found 1
                    break
                end
            end

            if test $found = 0
                echo "File not found"
                return 1
            end
        end
    end

    $cmd $args || echo "ZF Error: Command failed."
end
