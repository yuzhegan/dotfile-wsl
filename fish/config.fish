function time_awm --description="Bash time_awm function"
  command time_awm --portability $argv
end


set -g -x RANGER_LOAD_DEFAULT_RC FALSE
set fish_greeting ""
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export LC_CTYPE=zh_CN.UTF-8
export LANG=zh_CN.UTF-8
# set -x DISPLAY (awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
set TERM xterm-256color
[ -z "awk (ps -ef | grep cron | grep -v grep)" ] && sudo /etc/init.d/cron start &> /dev/null
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# set -gx DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0
set -Ux DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0


# fcitx5
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx

source ~/.profile

function l
    set -l tmp (mktemp)
    lfub --last-dir-path="$tmp" "$argv"
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
