# frappe_test.vim - A custom runner for vim-test plugin

## Current features:

![testing in action](https://user-images.githubusercontent.com/9079960/116586712-62c05780-a937-11eb-831f-650c52c07a0e.gif)

1. Run current test file
2. Run single unit test "near" cursor (through vim-test API)


## Setup / requirements

### Required plugins:

* [vim-test](https://github.com/vim-test/vim-test) to actually run the tests
* [vim-rooter](https://github.com/airblade/vim-rooter) to switch to correct root directory.

### Installation

Add this to your vimrc and do `:PlugInstall`. Other package managers _should_ work too.

```vim
Plug 'airblade/vim-rooter'
Plug 'vim-test/vim-test'
Plug 'ankush/frappe_test.vim'
```

###  Config:

Following is minimal recommended config. You may configure it to your preference, refer vim-test documentation for more.

```vim
let g:rooter_patterns = ['.git', 'package.json']

let test#custom_runners = {'python': ['Frappe']}
let test#enabled_runners = ["python#frappe"]

let g:test#python#frappe#testsite = "sitename"  " important to specify your test site name here
let g:test#python#frappe#arguments = "--skip-before-tests"  " arguments to run-test function
```

###  Running

* This is totally up to you, you can use `:TestNearest` or `:TestFile` command or bind them to a keychord.
* I prefer binding `<leader>t{n|f}` for near and file.


---

License: same as Vim `:h license`
