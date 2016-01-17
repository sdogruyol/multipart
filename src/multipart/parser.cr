module Multipart
  class Parser
    getter boundary, boundary_chars
    def initialize
      @boundary = ""
      @boundary_chars = {} of Char => Bool
      @look_behind = ""
      @state = :parser_uninitialized
      @index = 0
      @flags = {} of Symbol => Bool
      @marks = {} of Symbol => Int32
      @callbacks = {} of Symbol => Proc(Void)
    end

    def init_with_boundary(boundary)
      @boundary = "\r\n--" + boundary
      @lookbehind = "\0"*(@boundary.size + 8)
      @state = :start
      @boundary.each_byte do |b|
        @boundary_chars[b.chr] = true
      end
    end
  end

end
