function gunwip --description 'undo wip commit'
    if git log -1 --format=%B | grep -q -- --wip--
        git reset HEAD~1
    else
        echo "gunwip: HEAD is not a --wip-- commit; refusing" >&2
        return 1
    end
end
