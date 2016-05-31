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
      flat = project.cost + cost(project.cost, :flat)
      [
        flat,
        cost_per_amount(flat, :person, project.people),
        cost(flat, project.type)
      ].reduce(:+).round(2)
    end

    def cost_per_amount(price, markup, amount)
      price.is_a?(Numeric)  && amount.is_a?(Numeric) ? price * @markups.fetch(markup, 0) * amount : 0
    end
  end
end
