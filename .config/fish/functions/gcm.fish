function gcm --description 'git checkout default branch'
    set -l ref (git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed -e 's|^refs/remotes/origin/||')
    if test -z "$ref"
        if git show-ref --verify --quiet refs/heads/main
            set ref main
        else
            set ref master
        end
    end
    git checkout $ref $argv
end
