%student(name,sid,gpa)

student(minuri,1000,3.75).
student(hasith,1001,4.0).

%coursetaken(sid,course#,year,grade)

coursetaken(1000,ict1102,2012,'A').
coursetaken(1000,ict1103,2012,'B').
coursetaken(1000,ict1104,2012,'A').

coursetaken(1000,cmp1102,2012,'A').
coursetaken(1000,cmp1103,2012,'B').
coursetaken(1000,cmp1104,2012,'A').

coursetaken(1001,ict1102,2012,'A').
coursetaken(1001,ict1103,2012,'B').
coursetaken(1001,ict1104,2012,'A').

coursetaken(1001,cmp1102,2012,'A').
coursetaken(1001,cmp1103,2012,'B').
coursetaken(1001,cmp1104,2012,'A').

%course(course#,type,credits)

course(cmp1102,compulsory,1).
course(cmp1103,compulsory,1).
course(ict1102,optional,1).

%dept(sid, department)

dept(1000, cs).
dept(1001, cs).
dept(1002, cs).
