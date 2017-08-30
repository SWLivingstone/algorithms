class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent

  def initialize(title)
    @title = title
    @left = nil
    @right = nil
    @parent = nil
  end
end
