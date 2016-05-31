module Nupack
  class Calculator

    attr_reader :markups

    def initialize(markups=MARKUPS)
      @markups = markups
    end

    def cost(price, markup)
      price.is_a?(Numeric) ? price * @markups.fetch(markup, 0) : 0
    end

    def labour(price, amount_people)
      amount_people.is_a?(Numeric) ? price * (amount_people * @markups.fetch(:person, 0)) : 0
    end

    def estimate(project)
      [
        flat = project.cost + cost(project.cost, :flat),
        labour(flat, project.people),
        cost(flat, project.type)
      ].reduce(:+).round(2)
    end

    private

    def cost_per_amount(price, amount, markup)
      
    end
  end
end
