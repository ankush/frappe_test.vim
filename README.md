# frappe_test.vim

frappe_test: Running frappe unit tests with single click

A custom runner for https://github.com/vim-test/vim-test

## Current features:

1. Run current test file
2. Run single unit test "near" cursor (through vim-test api)

## Setup / requirements

- required plugins:
    * [vim-test](https://github.com/vim-test/vim-test) to actually run the tests
    * [vim-rooter](https://github.com/airblade/vim-rooter) to switch to correct root directory.
- Config:
    * copy `frappe.vim` to your `<VIM ROOT>/autoload/test/python/frappe.vim`
    * You need to configure both plugins mentioned above to your preference. E.g. key binds, test running strategy etc.
    * Following is minimal recommended plugin config.

    ```vim
    let g:rooter_patterns = ['.git', 'package.json']

    let test#custom_runners = {'python': ['Frappe']}
    let test#enabled_runners = ["python#frappe"]

    let g:test#python#frappe#testsite = "sitename"  " important to specify your test site name here
    ```
-  Running
    * This is totally up to you, you can use `:TestNearest` or `:TestFile` command or bind them to a keychord.


## TODO / good to have features:
1. make this installable with package manager.

License: same as Vim `:h license`
