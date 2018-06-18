\- : to see this help

q : q to quit

------------------ put the macro to register A

0 : create instance variable, public function __construct([$]variable, [$]orHere)  // [] <- cursor here

1 : create setter, [p]ublic $interval;  // [] <- cursor here

2 : create create getter, [p]ublic $interval;  // [] <- cursor here

3 : create incremented number each time the macro(register a) is executed, to set the starting number, set g:custom_temp

10 : convert form to sql syntax<br />
// convert<br />
name : Alief<br />
class : Archer<br />
// into<br />
INSERT INTO `` ('name','class') VALUES ('Alief','Archer')<br />

------------------ apply the macro immidiately (without using register a)

4 : add current date to each line (select the line first)
// convert
todolist 
todolist 
// into
@18 Juni 2018 - todolist 
@18 Juni 2018 - todolist 



6 : generate fdb entry template
"":{
  "birth-day":"",
  "alamat":"",
  "random-stories" : [
    ""
  ]
}

5 : auto update based on current date (only in ctd file)

7 : (still in dev)fold all /** ... */ 

8 : (still in dev)fold all {...}

