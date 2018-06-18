function! s:set_register_a(...)
  if len(a:000) > 0 
    let type = a:1
  else
    let exit_while = 0
    while exit_while == 0
      echo "\n=============================================\n"
      echo "- : to see this help"
      echo "q : q to quit"
      echo "------------------ put the macro to register A"
      echo "0 : create instance variable, public function __construct([$]variable, [$]orHere)  // [] <- cursor here"
      echo "1 : create setter, [p]ublic $interval;  // [] <- cursor here"
      echo "2 : create create getter, [p]ublic $interval;  // [] <- cursor here"
      echo "3 : create incremented number each time the macro(register a) is executed, to set the starting number, set g:custom_temp"
      echo "7 : (still in dev)fold all /** ... */ "
      echo "8 : (still in dev)fold all {...}"
      echo "10 : convert form to sql syntax"
      echo "------------------ apply the macro immidiately (without using register a)"
      echo "4 : add current date to each line (select the line first)"
      echo "6 : add fdb entry template"
      echo "5 : auto update based on current date (only in ctd file)"
      echo "------------------ temp"
      let type = input('Enter project type: ')
      if type == "-"
        let exit_while=0
      elseif type == "q"
        return
      else
        let exit_while=1
      endif
    endwhile
  endif


  if type == 0 
    let label = "create instance variable"
    let @a="mzevby/{o$this->ð = $ð;ä?class/{opublic $ð;ä`z"
  elseif type == 1
    let label = "create setter function"
    let @a="mzEvby/__constructOfun	ðäbisetälvU/(a$ðä/{o$this->ð = $ð;äjdd`z, "
  elseif type == 2
    let label = "create getter function"
    let @a="mzEvby/__constructOfun	ðäbigetälvU/{oreturn $this->ð;äjdd`z, "
  elseif type == 3
    let label = "create incremented number"
    let g:custom_temp=1
    let @a = ":let @s = g:custom_temp\"sP:let g:custom_temp = g:custom_temp + 1"
  elseif type == 4
    let label = "add current date to each line"
    let @s=Strip(system('date +%d\ %B\ %Y'))
    norm! gv:s/\v^(.*)/@s - \1/g, 
  elseif type == 5
    let label = "auto update based on current date"
    norm! mz
    execute "%!python $HOME/Documents/.script/library/VimSupportCtdManager.py auto_update_based_on_current_date"
    norm! 'z
    norm! zz
  elseif type == 6
    let label = "add fdb entry template (setted to register s)"
    let @s="\"\":{\n\"birth-day\":\"\",\n\"alamat\":\"\",\n\"random-stories\" : [\n\"\"\n]\n}"
    norm! "sPjvi{=
  elseif type == 7
    let label = "fold all /** ... */ "
    let @a=":set foldmarker=\/\*\*,\*\/:set foldmethod=marker:set foldmethod=manual"
  elseif type == 8
    let label = "8 : fold all {...}"
    let @a=":set foldmarker={,}:set foldmethod=marker:set foldmethod=manual"
  elseif type == 9
    let label = "9 : custom fold"
    setlocal foldmethod=expr
    function! GetPotionFold(lnum)
      if getline(a:lnum) =~? ' *\*'
        return '1'
      endif
    endfunction
    let @s=":setlocal foldexpr=GetPotionFold(v:lnum):set foldmethod=manual"
    normal @s
    
    setlocal foldmethod=manual
  elseif type == 10
    let label = "10 : convert form to sql syntax"
    let @a="yP'[mm']mngv:s/\\v^.{-}: (.*)/'\\1',/| nohl `>iú)ä`<i(ìúäv`>:s/\\n//:nohl'mV'nyP'[mm']mngv:s/\\v^(.{-}) : .*/'\\1',/| nohl `>iú)ä`<i(ìúäv`>:s/\\n//:nohli VALUES ä0hiINSERT INTO `` äOä"
  else 
    echo "undefined action"
    return
  endif
  echo "set done : ".label
endfunction 
:command! -nargs=* -range PredefinedMacro call s:set_register_a(<f-args>)
