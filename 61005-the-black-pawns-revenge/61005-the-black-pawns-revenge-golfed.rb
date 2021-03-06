F=
->b{s=->l,w=p{c,*x=l.map &:dup
v=[1,3,3,5,9,0]['PBNRQ'.index(c[y=w||c.index(?L)])||5]
w&&c[y]=?X
(n=x[0])?(m=[]
[y-1,y,y+1].map{|z|(z==y)^(n[z]>?.)&&m<<s[x,z]}
q,r=m.max_by{|m|m ?m[0]:0}
q&&[q+v,c+r]):[v,c]}
s[b.lines][1]}

require 'minitest/autorun'

describe F do
  def test_case_1
    input = <<-EOS
----L---
-----P--
------P-
--R--P-Q
----P-P-
---P-P-P
--P-N---
-P------
EOS

    F[input].must_equal <<-EOS
----L---
-----X--
------X-
--R--P-X
----P-X-
---P-X-P
--P-X---
-P--X---
EOS
  end

  def test_case_2
    input = <<-EOS
--L-----
-P------
P-------
-P------
P--Q----
-P------
P-------
-P------
EOS

    F[input].must_equal <<-EOS
--L-----
-PX-----
P-X-----
-PX-----
P--X----
-P-X----
P--X----
-P-X----
EOS
  end

end
