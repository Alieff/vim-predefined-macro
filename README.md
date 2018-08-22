# VIM Predefined Macro

Load already-predefined macro to register `a`

## Usage : 
1. Enter Ex command-line
2. execute

    `:PredefinedMacro <predefined_macro_number>`

## Installation :

1. Downlod twiddle-case.vim 
2. add this line into your `vimrc` (adjust ``<your-path>``)

    `so  <your-path>/predefined-macro.vim`


## License : 
GNU GPL

## Available Predefined Macro

1. **FOR PHP**. create instance variable

    `public function __construct([$]variable, $orHere)  // [] <- cursor here"`

2. **FOR PHP**. create setter

    `[p]ublic $interval;  // [] <- cursor here"`

3. **FOR PHP**. create create getter 

    `[p]ublic $interval;  // [] <- cursor here"`

4. Create incremented number each time the macro(register a) is executed, to set the starting number.

    `let g:custom_temp`

