require 'minitest/autorun'

F=
-> input, zoom {
  input.split(?\n).map do |l|
    zoom.times.map do |y|
      l.size.times.map do |i|
        zoom.times.map do |x|
          out_char = crt_char = l[i]

          out_char = ' '

          if zoom == y+1 && l[i-1..i]=='_\\'
            out_char = ?_
          end
          if zoom == y+1 && l[i..i+1]=='/_'
            out_char = ?_
          end

          out_char = crt_char if crt_char == ' '
          out_char = crt_char if x==y && crt_char == ?\\  
          out_char = crt_char if zoom==y+1 && crt_char == ?_
          out_char = crt_char if x+y+1==zoom && crt_char == ?/

          out_char
        end.join
      end.join.rstrip
    end - ['']
  end.join ?\n
}

describe '#F' do
  describe 'small diamond' do

    def diamond
      ' __
/_/\
\_\/
'
    end

    def test_1
      assert_equal F[diamond, 1], ' __
/_/\
\_\/'
    end

    def test_2
      assert_equal F[diamond, 2], '  ____
 /   /\
/___/  \
\   \  /
 \___\/'
    end

    def test_3
      assert_equal F[diamond, 3], '   ______
  /     /\
 /     /  \
/_____/    \
\     \    /
 \     \  /
  \_____\/'

    end

    def test_4
      assert_equal F[diamond, 4], '    ________
   /       /\
  /       /  \
 /       /    \
/_______/      \
\       \      /
 \       \    /
  \       \  /
   \_______\/'
    end

    def test_5
      assert_equal F[diamond, 5], '     __________
    /         /\
   /         /  \
  /         /    \
 /         /      \
/_________/        \
\         \        /
 \         \      /
  \         \    /
   \         \  /
    \_________\/'
    end

    def test_6
      assert_equal F[diamond, 6], '      ____________
     /           /\
    /           /  \
   /           /    \
  /           /      \
 /           /        \
/___________/          \
\           \          /
 \           \        /
  \           \      /
   \           \    /
    \           \  /
     \___________\/'
    end
  end

  describe 'medium diamond' do
    def diamond 
      '  ____
 /_/\_\
/\_\/_/\
\/_/\_\/
 \_\/_/'
    end

    def test_1
      assert_equal F[diamond, 1], '  ____
 /_/\_\
/\_\/_/\
\/_/\_\/
 \_\/_/'
    end

    def test_2
      assert_equal F[diamond, 2], '    ________
   /   /\   \
  /___/  \___\
 /\   \  /   /\
/  \___\/___/  \
\  /   /\   \  /
 \/___/  \___\/
  \   \  /   /
   \___\/___/'
    end

    def test_3
      assert_equal F[diamond, 3], '      ____________
     /     /\     \
    /     /  \     \
   /_____/    \_____\
  /\     \    /     /\
 /  \     \  /     /  \
/    \_____\/_____/    \
\    /     /\     \    /
 \  /     /  \     \  /
  \/_____/    \_____\/
   \     \    /     /
    \     \  /     /
     \_____\/_____/'
    end

    def test_4
      assert_equal F[diamond, 4], '        ________________
       /       /\       \
      /       /  \       \
     /       /    \       \
    /_______/      \_______\
   /\       \      /       /\
  /  \       \    /       /  \
 /    \       \  /       /    \
/      \_______\/_______/      \
\      /       /\       \      /
 \    /       /  \       \    /
  \  /       /    \       \  /
   \/_______/      \_______\/
    \       \      /       /
     \       \    /       /
      \       \  /       /
       \_______\/_______/'
    end

    def test_5
      assert_equal F[diamond, 5], '          ____________________
         /         /\         \
        /         /  \         \
       /         /    \         \
      /         /      \         \
     /_________/        \_________\
    /\         \        /         /\
   /  \         \      /         /  \
  /    \         \    /         /    \
 /      \         \  /         /      \
/        \_________\/_________/        \
\        /         /\         \        /
 \      /         /  \         \      /
  \    /         /    \         \    /
   \  /         /      \         \  /
    \/_________/        \_________\/
     \         \        /         /
      \         \      /         /
       \         \    /         /
        \         \  /         /
         \_________\/_________/'
    end

    def test_6
      assert_equal F[diamond, 6], '            ________________________
           /           /\           \
          /           /  \           \
         /           /    \           \
        /           /      \           \
       /           /        \           \
      /___________/          \___________\
     /\           \          /           /\
    /  \           \        /           /  \
   /    \           \      /           /    \
  /      \           \    /           /      \
 /        \           \  /           /        \
/          \___________\/___________/          \
\          /           /\           \          /
 \        /           /  \           \        /
  \      /           /    \           \      /
   \    /           /      \           \    /
    \  /           /        \           \  /
     \/___________/          \___________\/
      \           \          /           /
       \           \        /           /
        \           \      /           /
         \           \    /           /
          \           \  /           /
           \___________\/___________/'
    end
  end


  describe 'big diamond' do
    def diamond 
      '   ______
  /_/_/\_\
 /_/\_\/\_\
/\_\/_/\/_/\
\/_/\_\/_/\/
 \_\/_/\_\/
  \_\_\/_/'
    end

    def test_1
      assert_equal F[diamond, 1], '   ______
  /_/_/\_\
 /_/\_\/\_\
/\_\/_/\/_/\
\/_/\_\/_/\/
 \_\/_/\_\/
  \_\_\/_/'
    end
    
    def test_2
      assert_equal F[diamond, 2], '      ____________
     /   /   /\   \
    /___/___/  \___\
   /   /\   \  /\   \
  /___/  \___\/  \___\
 /\   \  /   /\  /   /\
/  \___\/___/  \/___/  \
\  /   /\   \  /   /\  /
 \/___/  \___\/___/  \/
  \   \  /   /\   \  /
   \___\/___/  \___\/
    \   \   \  /   /
     \___\___\/___/'
    end
    
    def test_3
      assert_equal F[diamond, 3], '         __________________
        /     /     /\     \
       /     /     /  \     \
      /_____/_____/    \_____\
     /     /\     \    /\     \
    /     /  \     \  /  \     \
   /_____/    \_____\/    \_____\
  /\     \    /     /\    /     /\
 /  \     \  /     /  \  /     /  \
/    \_____\/_____/    \/_____/    \
\    /     /\     \    /     /\    /
 \  /     /  \     \  /     /  \  /
  \/_____/    \_____\/_____/    \/
   \     \    /     /\     \    /
    \     \  /     /  \     \  /
     \_____\/_____/    \_____\/
      \     \     \    /     /
       \     \     \  /     /
        \_____\_____\/_____/'
    end
    
    def test_4
      assert_equal F[diamond, 4], '            ________________________
           /       /       /\       \
          /       /       /  \       \
         /       /       /    \       \
        /_______/_______/      \_______\
       /       /\       \      /\       \
      /       /  \       \    /  \       \
     /       /    \       \  /    \       \
    /_______/      \_______\/      \_______\
   /\       \      /       /\      /       /\
  /  \       \    /       /  \    /       /  \
 /    \       \  /       /    \  /       /    \
/      \_______\/_______/      \/_______/      \
\      /       /\       \      /       /\      /
 \    /       /  \       \    /       /  \    /
  \  /       /    \       \  /       /    \  /
   \/_______/      \_______\/_______/      \/
    \       \      /       /\       \      /
     \       \    /       /  \       \    /
      \       \  /       /    \       \  /
       \_______\/_______/      \_______\/
        \       \       \      /       /
         \       \       \    /       /
          \       \       \  /       /
           \_______\_______\/_______/'
    end
    
    def test_5
      assert_equal F[diamond, 5], '               ______________________________
              /         /         /\         \
             /         /         /  \         \
            /         /         /    \         \
           /         /         /      \         \
          /_________/_________/        \_________\
         /         /\         \        /\         \
        /         /  \         \      /  \         \
       /         /    \         \    /    \         \
      /         /      \         \  /      \         \
     /_________/        \_________\/        \_________\
    /\         \        /         /\        /         /\
   /  \         \      /         /  \      /         /  \
  /    \         \    /         /    \    /         /    \
 /      \         \  /         /      \  /         /      \
/        \_________\/_________/        \/_________/        \
\        /         /\         \        /         /\        /
 \      /         /  \         \      /         /  \      /
  \    /         /    \         \    /         /    \    /
   \  /         /      \         \  /         /      \  /
    \/_________/        \_________\/_________/        \/
     \         \        /         /\         \        /
      \         \      /         /  \         \      /
       \         \    /         /    \         \    /
        \         \  /         /      \         \  /
         \_________\/_________/        \_________\/
          \         \         \        /         /
           \         \         \      /         /
            \         \         \    /         /
             \         \         \  /         /
              \_________\_________\/_________/'
    end
    
    def test_6
      assert_equal F[diamond, 6], '                  ____________________________________
                 /           /           /\           \
                /           /           /  \           \
               /           /           /    \           \
              /           /           /      \           \
             /           /           /        \           \
            /___________/___________/          \___________\
           /           /\           \          /\           \
          /           /  \           \        /  \           \
         /           /    \           \      /    \           \
        /           /      \           \    /      \           \
       /           /        \           \  /        \           \
      /___________/          \___________\/          \___________\
     /\           \          /           /\          /           /\
    /  \           \        /           /  \        /           /  \
   /    \           \      /           /    \      /           /    \
  /      \           \    /           /      \    /           /      \
 /        \           \  /           /        \  /           /        \
/          \___________\/___________/          \/___________/          \
\          /           /\           \          /           /\          /
 \        /           /  \           \        /           /  \        /
  \      /           /    \           \      /           /    \      /
   \    /           /      \           \    /           /      \    /
    \  /           /        \           \  /           /        \  /
     \/___________/          \___________\/___________/          \/
      \           \          /           /\           \          /
       \           \        /           /  \           \        /
        \           \      /           /    \           \      /
         \           \    /           /      \           \    /
          \           \  /           /        \           \  /
           \___________\/___________/          \___________\/
            \           \           \          /           /
             \           \           \        /           /
              \           \           \      /           /
               \           \           \    /           /
                \           \           \  /           /
                 \___________\___________\/___________/'
    end
  end  

  describe 'even bigger diamond' do
    def diamond 
      '    ________
   /_/\_\_\_\
  /\_\/\_\_\_\
 /\/_/\/_/_/\_\
/\/\_\/_/_/\/\_\ 
\/\/_/\_\_\/\/_/
 \/\_\/_/\_\/_/
  \/\_\_\/_/_/
   \/_/_/_/_/'
    end

    def test_1
      assert_equal F[diamond, 1], '    ________
   /_/\_\_\_\
  /\_\/\_\_\_\
 /\/_/\/_/_/\_\
/\/\_\/_/_/\/\_\
\/\/_/\_\_\/\/_/
 \/\_\/_/\_\/_/
  \/\_\_\/_/_/
   \/_/_/_/_/'
    end
    
    def test_2
      assert_equal F[diamond, 2], '        ________________
       /   /\   \   \   \
      /___/  \___\___\___\
     /\   \  /\   \   \   \
    /  \___\/  \___\___\___\
   /\  /   /\  /   /   /\   \
  /  \/___/  \/___/___/  \___\
 /\  /\   \  /   /   /\  /\   \
/  \/  \___\/___/___/  \/  \___\
\  /\  /   /\   \   \  /\  /   /
 \/  \/___/  \___\___\/  \/___/
  \  /\   \  /   /\   \  /   /
   \/  \___\/___/  \___\/___/
    \  /\   \   \  /   /   /
     \/  \___\___\/___/___/
      \  /   /   /   /   /
       \/___/___/___/___/'
    end
    
    def test_3
      assert_equal F[diamond, 3], '            ________________________
           /     /\     \     \     \
          /     /  \     \     \     \
         /_____/    \_____\_____\_____\
        /\     \    /\     \     \     \
       /  \     \  /  \     \     \     \
      /    \_____\/    \_____\_____\_____\
     /\    /     /\    /     /     /\     \
    /  \  /     /  \  /     /     /  \     \
   /    \/_____/    \/_____/_____/    \_____\
  /\    /\     \    /     /     /\    /\     \
 /  \  /  \     \  /     /     /  \  /  \     \
/    \/    \_____\/_____/_____/    \/    \_____\
\    /\    /     /\     \     \    /\    /     /
 \  /  \  /     /  \     \     \  /  \  /     /
  \/    \/_____/    \_____\_____\/    \/_____/
   \    /\     \    /     /\     \    /     /
    \  /  \     \  /     /  \     \  /     /
     \/    \_____\/_____/    \_____\/_____/
      \    /\     \     \    /     /     /
       \  /  \     \     \  /     /     /
        \/    \_____\_____\/_____/_____/
         \    /     /     /     /     /
          \  /     /     /     /     /
           \/_____/_____/_____/_____/'
    end
    
    def test_4
      assert_equal F[diamond, 4], '                ________________________________
               /       /\       \       \       \
              /       /  \       \       \       \
             /       /    \       \       \       \
            /_______/      \_______\_______\_______\
           /\       \      /\       \       \       \
          /  \       \    /  \       \       \       \
         /    \       \  /    \       \       \       \
        /      \_______\/      \_______\_______\_______\
       /\      /       /\      /       /       /\       \
      /  \    /       /  \    /       /       /  \       \
     /    \  /       /    \  /       /       /    \       \
    /      \/_______/      \/_______/_______/      \_______\
   /\      /\       \      /       /       /\      /\       \
  /  \    /  \       \    /       /       /  \    /  \       \
 /    \  /    \       \  /       /       /    \  /    \       \
/      \/      \_______\/_______/_______/      \/      \_______\
\      /\      /       /\       \       \      /\      /       /
 \    /  \    /       /  \       \       \    /  \    /       /
  \  /    \  /       /    \       \       \  /    \  /       /
   \/      \/_______/      \_______\_______\/      \/_______/
    \      /\       \      /       /\       \      /       /
     \    /  \       \    /       /  \       \    /       /
      \  /    \       \  /       /    \       \  /       /
       \/      \_______\/_______/      \_______\/_______/
        \      /\       \       \      /       /       /
         \    /  \       \       \    /       /       /
          \  /    \       \       \  /       /       /
           \/      \_______\_______\/_______/_______/
            \      /       /       /       /       /
             \    /       /       /       /       /
              \  /       /       /       /       /
               \/_______/_______/_______/_______/'
    end
    
    def test_5
      assert_equal F[diamond, 5], '                    ________________________________________
                   /         /\         \         \         \
                  /         /  \         \         \         \
                 /         /    \         \         \         \
                /         /      \         \         \         \
               /_________/        \_________\_________\_________\
              /\         \        /\         \         \         \
             /  \         \      /  \         \         \         \
            /    \         \    /    \         \         \         \
           /      \         \  /      \         \         \         \
          /        \_________\/        \_________\_________\_________\
         /\        /         /\        /         /         /\         \
        /  \      /         /  \      /         /         /  \         \
       /    \    /         /    \    /         /         /    \         \
      /      \  /         /      \  /         /         /      \         \
     /        \/_________/        \/_________/_________/        \_________\
    /\        /\         \        /         /         /\        /\         \
   /  \      /  \         \      /         /         /  \      /  \         \
  /    \    /    \         \    /         /         /    \    /    \         \
 /      \  /      \         \  /         /         /      \  /      \         \
/        \/        \_________\/_________/_________/        \/        \_________\
\        /\        /         /\         \         \        /\        /         /
 \      /  \      /         /  \         \         \      /  \      /         /
  \    /    \    /         /    \         \         \    /    \    /         /
   \  /      \  /         /      \         \         \  /      \  /         /
    \/        \/_________/        \_________\_________\/        \/_________/
     \        /\         \        /         /\         \        /         /
      \      /  \         \      /         /  \         \      /         /
       \    /    \         \    /         /    \         \    /         /
        \  /      \         \  /         /      \         \  /         /
         \/        \_________\/_________/        \_________\/_________/
          \        /\         \         \        /         /         /
           \      /  \         \         \      /         /         /
            \    /    \         \         \    /         /         /
             \  /      \         \         \  /         /         /
              \/        \_________\_________\/_________/_________/
               \        /         /         /         /         /
                \      /         /         /         /         /
                 \    /         /         /         /         /
                  \  /         /         /         /         /
                   \/_________/_________/_________/_________/'
    end
    
    def test_6
      assert_equal F[diamond, 6], '                        ________________________________________________
                       /           /\           \           \           \
                      /           /  \           \           \           \
                     /           /    \           \           \           \
                    /           /      \           \           \           \
                   /           /        \           \           \           \
                  /___________/          \___________\___________\___________\
                 /\           \          /\           \           \           \
                /  \           \        /  \           \           \           \
               /    \           \      /    \           \           \           \
              /      \           \    /      \           \           \           \
             /        \           \  /        \           \           \           \
            /          \___________\/          \___________\___________\___________\
           /\          /           /\          /           /           /\           \
          /  \        /           /  \        /           /           /  \           \
         /    \      /           /    \      /           /           /    \           \
        /      \    /           /      \    /           /           /      \           \
       /        \  /           /        \  /           /           /        \           \
      /          \/___________/          \/___________/___________/          \___________\
     /\          /\           \          /           /           /\          /\           \
    /  \        /  \           \        /           /           /  \        /  \           \
   /    \      /    \           \      /           /           /    \      /    \           \
  /      \    /      \           \    /           /           /      \    /      \           \
 /        \  /        \           \  /           /           /        \  /        \           \
/          \/          \___________\/___________/___________/          \/          \___________\
\          /\          /           /\           \           \          /\          /           /
 \        /  \        /           /  \           \           \        /  \        /           /
  \      /    \      /           /    \           \           \      /    \      /           /
   \    /      \    /           /      \           \           \    /      \    /           /
    \  /        \  /           /        \           \           \  /        \  /           /
     \/          \/___________/          \___________\___________\/          \/___________/
      \          /\           \          /           /\           \          /           /
       \        /  \           \        /           /  \           \        /           /
        \      /    \           \      /           /    \           \      /           /
         \    /      \           \    /           /      \           \    /           /
          \  /        \           \  /           /        \           \  /           /
           \/          \___________\/___________/          \___________\/___________/
            \          /\           \           \          /           /           /
             \        /  \           \           \        /           /           /
              \      /    \           \           \      /           /           /
               \    /      \           \           \    /           /           /
                \  /        \           \           \  /           /           /
                 \/          \___________\___________\/___________/___________/
                  \          /           /           /           /           /
                   \        /           /           /           /           /
                    \      /           /           /           /           /
                     \    /           /           /           /           /
                      \  /           /           /           /           /
                       \/___________/___________/___________/___________/'
    end
  end  


end