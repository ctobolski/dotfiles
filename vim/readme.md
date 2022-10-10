## Todoskis
- Look up submodules for managing packages
- here's a neat command to get all the stuff you already have installed submoduled
- start/opt dirs
- auto update
- add/remove
# cool command for fd -H -I --glob config /home/chris/.vim/pack/packages/start -x bat | grep url | awk {'print '} | xargs -I{} git submodule add {}



# Configuration

## CoC 
Extensions are installed using CoC. Current ones are: 
- coc-snippets
- coc-tsserver
- coc-json
