import re

thelookfor = r"yandex"
allresults = re.findall(textlookfor,mytext)

print(allresults)

\d = Any Digit 0-9
\D = Any non digit
\w = Any alphabet symbol [A-Z a-z]
\W = Any non alphabet symbol
\s = Breakspace
\S = Non Breakspace

(?!intel\.com)
[0-9]{4}
[A-Z][a-z]+
[\w]+\.[\w]+
[\w.-]+@[A-Za-z-]+\.[\w.]+
\n = enter
regex101.com