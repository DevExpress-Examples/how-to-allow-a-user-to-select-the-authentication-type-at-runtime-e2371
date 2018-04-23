;#DropDB Solution73EasyTest

#Application Solution73Win
#Application Solution73Web

*Action Navigation(User)

*ProcessRecord
 Full Name = ''

#IfDef Solution73Web
*Action Edit
#EndIf
 
*FillForm
 Full Name = Test User
 
*Action Cancel

#IfDef Solution73Win
*HandleDialog
 Respond = Yes
#EndIf

*CheckFieldValues
 Full Name = ''
