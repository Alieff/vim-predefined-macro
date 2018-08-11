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
      echo "4 : (still in dev)fold all /** ... */ "
      echo "5 : (still in dev)fold all {...}"
      echo "6 : custom fold"
      echo "7 : convert form to sql syntax"
      echo "8 : recursive macro"
      echo "------------------ apply the macro immidiately (without using register a)"
      echo "b1 : add current date to each line (select the line first)"
      echo "b2 : add fdb entry template"
      echo "b3 : auto update based on current date (only in ctd file)"
      echo "b4 : create one to many entry"
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


  if type == "0" 
    let label = "create instance variable"
    let @a="mzevby/{o$this->ð = $ð;ä?class/{opublic $ð;ä`z"
  elseif type == "1"
    let label = "create setter function"
    let @a="mzEvby/__constructOfun	ðäbisetälvU/(a$ðä/{o$this->ð = $ð;äjdd`z, "
  elseif type == "2"
    let label = "create getter function"
    let @a="mzEvby/__constructOfun	ðäbigetälvU/{oreturn $this->ð;äjdd`z, "
  elseif type == "3"
    let label = "create incremented number"
    let g:custom_temp=1
    let @a = ":let @s = g:custom_temp\"sP:let g:custom_temp = g:custom_temp + 1"
  elseif type == "4"
    let label = "fold all /** ... */ "
    let @a=":set foldmarker=\/\*\*,\*\/:set foldmethod=marker:set foldmethod=manual"
  elseif type == "5"
    let label = "8 : fold all {...}"
    let @a=":set foldmarker={,}:set foldmethod=marker:set foldmethod=manual"
  elseif type == "6"
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
  elseif type == "7"
    let label = "10 : convert form to sql syntax"
    let @a="yP'[mm']mngv:s/\\v^.{-}: (.*)/'\\1',/| nohl `>iú)ä`<i(ìúäv`>:s/\\n//:nohl'mV'nyP'[mm']mngv:s/\\v^(.{-}) : .*/'\\1',/| nohl `>iú)ä`<i(ìúäv`>:s/\\n//:nohli VALUES ä0hiINSERT INTO `` äOä"
  elseif type == "8"
    let label ="11 : set recursive macro to reg a"
    let @a="@q@a"
  elseif type == "b1"
    let label = "add current date to each line"
    let @s=Strip(system('date +%d\ %B\ %Y'))
    norm! gv:s/\v^(.*)/@s - \1/g, 
  elseif type == "b2"
    let label = "add fdb entry template (setted to register s)"
    let @s="\"\":{\n\"birth-day\":\"\",\n\"alamat\":\"\",\n\"random-stories\" : [\n\"\"\n]\n}"
    norm! "sPjvi{=
  elseif type == "b3"
    let label = "auto update based on current date"
    norm! mz
    execute "%!python $HOME/Documents/.script/library/VimSupportCtdManager.py auto_update_based_on_current_date"
    norm! 'z
    norm! zz
  elseif type == "b4"
    let label = " change to one to many"
    " append all line with '>'
    execute ":%s/\\v^(.*)/>\\1/g"
    " add last,and first line with '>'
    execute ":1s/\\v(.*)/>\\r\\1\/g"
    execute ":$s/\\v(.*)/\\1\\r\>/g"
    " remove all bracess leaving a - b,c,d format
    execute ":%s/\\v\\(.{-}\\)//g"
    " move the array part to newline, and append with #
    execute ":%s/\\v([0-9]*,[0-9]*,)\"(.*)\"/\\1\\r#\\2/g"
    " add newline to all array member
    execute ":%s/\\v((#.*)@<=,)/\\1\\r#/g"
    " " execute macro to subtitute all # with the id, caution this use recursive macro, in this case we use q register
    normal gg
    let @q='/>lv$hyjV/>k:s/#/0/g@q'
    normal @q
    " " delete all >
    execute ":%s/\\v^\\>.*//g"
  else 
    echo "undefined action"
    return
  endif
  echo "set done : ".label
endfunction 
:command! -nargs=* -range PredefinedMacro call s:set_register_a(<f-args>)
