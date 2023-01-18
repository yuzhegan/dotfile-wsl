function time_awm --description="Bash time_awm function"
  command time_awm --portability $argv
end


set -g -x RANGER_LOAD_DEFAULT_RC FALSE
set fish_greeting ""
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
# set -x DISPLAY (awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
set TERM xterm-256color
[ -z "awk (ps -ef | grep cron | grep -v grep)" ] && sudo /etc/init.d/cron start &> /dev/null

set -gx DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0

source ~/.profile

function l
    set -l tmp (mktemp)
    lf --last-dir-path="$tmp" "$argv"
    if test -f "$tmp"
        set -l dir (cat "$tmp")
        rm -f "$tmp"
        if test -d "$dir"
            if test "$dir" != (pwd)
                cd "$dir"
            end
        end
    end
end
