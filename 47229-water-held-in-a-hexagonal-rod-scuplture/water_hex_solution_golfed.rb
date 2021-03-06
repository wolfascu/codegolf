# http://codegolf.stackexchange.com/questions/47229/water-held-in-a-hexagonal-r-scuplture
require 'minitest/autorun'

# The program is wrapped in a function, in order for it to be testable.
# `ii` is used instead of `$<`
# (`$<` cannot be mocked in tests and `ii` is also 2 chars long)
f=->ii{
# -- program begin --
s={}
l=ii.lines
y=0
l.map{|r|x=0
r.scan(/../){s[[x,y]]=[v=$&.to_i,v<1?0:99];x+=1}
y+=1}
loop{break if s.map{|c,r|x,y=c
m = [[-1,-1],[1,-1],[-2,0],[2,0],[1,-1],[1,1]].map{|w,z|s[[x+w,y+z]]}.map{|n|n ?n[0]+n[1]:0}.min
r[1]=[0,m-r[0]].max if r[0]+r[1]>m&&r[1]>0}.none?}
puts s.map{|c,r|r[1]}.reduce :+
# -- program end --

# return the result, for testing
s.map{|c,r|r[1]}.reduce :+
}


describe '#f' do

  it 'passes test case #1' do
    i = <<-EOS
  04  04
04  01  03
  04  04
EOS

    assert_equal 2, f[i]
  end

  it 'passes test case #2' do
    i = <<-EOS
55  34  45  66
  33  21  27
23  12  01  77
  36  31  74
EOS

    assert_equal 35, f[i]
  end


  it 'passes test case #3' do
    i = <<-EOS
        35  36  77  22                      23  32  54  24
      33  07  02  04  21                  54  07  07  07  76
    20  04  07  07  01  20              54  11  81  81  07  76
  20  67  67  22  07  01  78          54  07  81  07  81  09  76
20  67  07  67  22  22  07  44  55  54  07  81  07  07  61  07  20
  67  57  50  50  07  07  14  03  02  15  81  99  91  07  81  04
67  07  50      50  87  39  45  41  34  81  07  07  89  07  81  79
  67  07  50  50  07  07  07  27  07  27  81  07  07  79  81  78
20  67  67  07  07  07  07  99  33  46  02  81  07  07  81  01  20
  33  07  07  01  05  01  92          20  02  81  07  81  15  32
    22  07  20  20  07  20              63  02  80  81  15  32
      45  20  01  20  39                  20  15  07  15  32
        23  20  20  29  43  21  18  41  20  66  66  43  21
      90                  99  47  07  20
    50                      20  02  48
  70                          56  20
                                90
EOS

    assert_equal 1432, f[i]
  end
end
