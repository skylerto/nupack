module Nupack
  class Calculator

    attr_reader :markups

    def initialize(markups=MARKUPS)
      @markups = markups
    end

    def cost(price, markup)
      price.is_a?(Numeric) ? price * @markups.fetch(markup, 0) : 0
    end

    def estimate(project)
      [
        project.cost,
        flat = cost(project.cost, :flat),
        cost(flat, :person),
        cost(flat, project.type)
      ].reduce(:+).round(2)
    end
  end
end
