module Nupack
  class Calculator

    attr_reader :markups

    def initialize(markups=MARKUPS)
      @markups = markups
    end
  end
end
