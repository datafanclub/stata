{smcl}
{* 20 Feb 2002/19 Jul 2006}{...}
{hline}
help for {hi:winsor2}
{hline}

{title:Winsorizing or Trimming variables}


{title:Syntax}

{p 4 19 2}
{cmdab:winsor2} {varlist} {ifin},  
[
{cmdab:s:uffix:}{cmd:(}string{cmd:)}
{opt replace}
{opt tr:im}
{cmdab:c:uts(}{it:#} {it:#}{cmd:)} 
{opth by:(varlist:groupvar)}
]


{title:Description}

{p 4 4 2}
{cmd:winsor2} winsorize or trim (if {cmd:trim} option is specified) the variables in {varlist} 
at particular percentiles specified by option {bf: cuts(#1 #2)}.
In defult, new variables will be generated with a suffix "_w" or "_tr", which can be changed by 
specifying {bf:suffix()} option. 
The {bf:replace} option replaces the variables with their winsorized or trimmed ones.

{error}{dlgtab:Difference between winsorizing and trimming}{text}

{p 4 4 2}
Winsorizing is not equivalent to simply excluding data, 
which is a simpler procedure, called trimming or truncation.
In a trimmed estimator, the extreme values are discarded; 
in a Winsorized estimator, the extreme values are instead 
replaced by certain percentiles, specified by option cuts(# #).
For details, see {help winsor} (if installed), {help trimmean} (if installed).

{p 4 4 2}
For example, you type the following commands to get the 1th and 99th 
percentiles of variable wage, 1.930993 and 38.70926, respectively.

{phang2} {bf: . sysuse nlsw88, clear} {p_end}
{phang2} {bf: . sum wage, detail} {p_end}

{p 4 4 2}
In defult, {cmd:winsor2} winsorize wage at 1th and 99th percentiles,
 
{phang2} {bf: . winsor2 wage, replace cuts(1 99)} {p_end}

{p 4 4 2}
which can be done by hands:

{phang2} {bf: . replace wage=1.930993 if wage<1.930993} {p_end}
{phang2} {bf: . replace wage=38.70926 if wage>38.70926} {p_end}

{p 4 4 2} 
Note that, values smaller than the 1th percentile is repalce by the 1th percentile,
and the similar thing is done with the 99th percentile.

{p 4 4 2}
Things change when -{bf: trim}- option is specified:

{phang2} {bf: . winsor2 wage, replace cuts(1 99) trim} {p_end}

{p 4 4 2}
which can also be done by hands:

{phang2} {bf: . replace wage=. if wage<1.930993} {p_end}
{phang2} {bf: . replace wage=. if wage>38.70926} {p_end}

{p 4 4 2}
In this case, we discard values smaller than 1th percentile or greater than 99th percentile.
This is trimming.


{title:Options}

{p 4 8 2}{cmd:suffix(}{it:string}{cmd:)} specifies the suffix of the new
variables. The defult is "_w" or "_tr" (when {bf:trim} specified).

{p 4 8 2}{cmd:replace} replaces the variables with their winsorized or trimmed counterpart.
Can not be specified with {cmd:suffix(}{it:string}{cmd:)}.

{p 4 8 2}{cmd:trim} trims the variables.

{p 4 8 2}{cmd:cuts(}{it:#} {it:#}{cmd:)} specifies the percentiles at which the
data is winsorized or trimmed. {bf: cuts(1 99)} (the default) means winsor (trim) at 1th and 99th
percentile. Specify {bf: cuts(1 99)} or {bf: cuts(99 1)} makes no difference.

{p 4 8 2}{opth by:(varlist:groupvar)} the winsor or trim is done within each group specified by 
{it:groupvar}.


{title:Examples}

{phang2} *- winsor at (p1 p99), get new variable "wage_w" {p_end}
{phang2}{inp:.} {stata "sysuse nlsw88, clear":  sysuse nlsw88, clear}{p_end}
{phang2}{inp:.} {stata "winsor2 wage":  winsor2 wage}{p_end}

{phang2} *- left-trimming at 2th percentile {p_end}
{phang2}{inp:.} {stata "winsor2 wage, cuts(2 100) trim":  winsor2 wage, cuts(2 100) trim}{p_end}

{phang2} *- winsor variables by (industry south), overwrite the old variables {p_end}
{phang2}{inp:.} {stata "winsor2 wage hours, replace by(industry south)":  winsor2 wage hours, replace by(industry south)}{p_end}


{title:References}

{p 4 8 2}Anonymous. 1951. In memoriam: Charles P. winsor2.
{it:Biometrics} 7: 221.

{p 4 8 2}Barnett, V. and Lewis, T. 1994. {it:Outliers in statistical data.}
Chichester: John Wiley. [Previous editions 1978, 1984.]

{p 4 8 2}Tukey, J.W. 1962. The future of data analysis.
{it:Annals of Mathematical Statistics} 33: 1{c -}67.


{title:Acknowledgements}

{p 4 8 2}
Codes from {help winsor} by Nicholas J. Cox and 
-winsorizeJ.ado- by Judson Caskey 
have been incorporated.

{title:Author}

{phang}
{cmd:Yujun,Lian (Arlion)} Department of Finance, Lingnan College, Sun Yat-Sen University.{break}
E-mail: {browse "mailto:arlionn@163.com":arlionn@163.com}. {break}
Blog: {browse "http://blog.cnfol.com/arlion":http://blog.cnfol.com/arlion}. {break}
Homepage: {browse "http://www.lingnan.sysu.edu.cn/lnshizi/faculty_vch.asp?name=lianyj":http://www.lingnan.sysu.edu.cn/lnshizi/faculty_vch.asp?name=lianyj}. {break}
{p_end}


{title:Also see}

{p 4 13 2}
Online:  
{help summarize}, 
{help means}, 
{help winsor} (if installed),
{help trimplot} (if installed), 
{help trimmean} (if installed), 
{help iqr} (if installed), 
{help robmean} (if installed)
