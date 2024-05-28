#lang "qb"
start:
Shell ("cd >cd")
Open "cd" For Input As #1
Input #1, cd$
Close
ChDir cd$ + "\TEMP"
Shell ("del *.*")
ChDir cd$
RmDir cd$ + "\TEMP"
MkDir cd$ + "\TEMP"
Print "PBSL Version 0.1 (Concept Stage)"
Print "PBSL : Enter PBSL file to run"
Input file$
chained:
Close
Cls
On Error GoTo file
Print "PBSL : Opening File:"
Open file$ + ".pbsl" For Input As #1
Do
    Input #1, cmd$
    cmdf$ = Left$(cmd$, 2)
    If cmdf$ = "as" Then
        Print "PBSL : Not implemented"

    ElseIf cmdf$ = "ce" Then
        Mid$(cmd$, 1, 3) = "   "
        cmd$ = LTrim$(cmd$)
        On Error GoTo file
        Chain cmd$

    ElseIf cmdf$ = "cl" Then
        Cls

    ElseIf cmdf$ = "cs" Then
        Mid$(cmd$, 1, 3) = "   "
        cmd$ = LTrim$(cmd$)
        On Error GoTo file
        file$ = cmd$
        Print file$
        Print "PBSL : Chain called"
        Sleep 2

        GoTo chained

    ElseIf cmdf$ = "en" Then
        End

    ElseIf cmdf$ = "ii" Then
        Mid$(cmd$, 1, 3) = "   "
        cmd$ = LTrim$(cmd$)
        Input ii
        Open cd$ + "\TEMP\" + cmd$ For Output As #2
        Write #2, ii
        Close #2

    ElseIf cmdf$ = "is" Then
        Mid$(cmd$, 1, 3) = "   "
        cmd$ = LTrim$(cmd$)
        Input is$
        Open cd$ + "\TEMP\" + cmd$ + "$" For Output As #2
        Write #2, is$
        Close #2

    ElseIf cmdf$ = "pa" Then
        Print "Press Any Key to Continue"
        Do
        Loop Until InKey$ <> ""

    ElseIf cmdf$ = "pi" Then
        Mid$(cmd$, 1, 3) = "   "
        cmd$ = LTrim$(cmd$)
        Open cd$ + "\TEMP\" + cmd$ For Input As #2
        Input #2, pi
        Close #2
        Print pi

    ElseIf cmdf$ = "pr" Then
        Mid$(cmd$, 1, 3) = "   "
        Print LTrim$(cmd$)

    ElseIf cmdf$ = "ps" Then
        Mid$(cmd$, 1, 3) = "   "
        cmd$ = LTrim$(cmd$)
        Open cd$ + "\TEMP\" + cmd$ + "$" For Input As #2
        Input #2, ps$
        Close #2
        Print ps$

    ElseIf cmdf$ = "re" Then
        Mid$(cmd$, 1, 3) = "   "
        cmd$ = LTrim$(cmd$)
        On Error GoTo file
        Shell cmd$

    ElseIf cmdf$ = "sl" Then
        Print ""

    ElseIf cmdf$ = "zz" Then
    ` friends wanted an easter egg
    print "sudeep"

    Else
        GoTo syntax
    End If
Loop Until EOF(1)
Close
GoTo term

file: Print "PBSL : File not found"
syntax: Print "PBSL : Syntax Error"
term:

End
