
def is_capture_possible(board)
  # expand board
  board = board.gsub(/\d/){|x|?.*x.to_i}

  # check if capture possible
  # (if there are a p and a P with 7 or 9 chars between them)
  board =~ /p.{7}(..)?P/
end


require 'minitest/autorun'

describe :is_capture_possible do
  it('recognizes when capture is possible') do 
    assert is_capture_possible('8/7p/6P1/8/8/8/8/8')
    assert is_capture_possible('8/8/p7/1P6/3P3p/8/8/8')
    assert is_capture_possible('8/2P5/8/4P1p1/2p2P2/3p4/3p1P2/8')
    assert is_capture_possible('8/P7/8/5P2/2pp4/3P2p1/3pP3/8')
    assert is_capture_possible('8/P7/p7/p1P1P3/1P3p2/8/1p6/8')
    assert is_capture_possible('8/4p1P1/2P2P1P/2p1pPpp/8/6P1/pP1p4/8')
  end

  it('recognizes when capture is impossible') do 
    refute is_capture_possible('8/8/8/8/8/8/8/8')
    refute is_capture_possible('8/7P/6p1/8/8/8/8/8')
    refute is_capture_possible('8/7p/7P/8/8/8/8/8')
    refute is_capture_possible('8/pppppppp/8/8/8/8/PPPPPPPP/8')
    refute is_capture_possible('8/p7/8/1p6/5P2/8/8/8')
    refute is_capture_possible('8/p7/P7/2P1p1p1/2p5/8/PP6/8')
  end
end