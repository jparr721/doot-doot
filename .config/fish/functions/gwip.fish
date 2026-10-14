function gwip --description 'git wip commit'
    git add -A
    git commit --no-verify -m "--wip-- [skip ci]"
end
