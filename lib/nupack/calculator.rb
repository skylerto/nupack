module Nupack
  class Calculator

    attr_reader :markups

    def initialize(markups=MARKUPS)
      @markups = markups
    end

    def cost(price, markup, people=nil)
      if price.is_a?(Numeric)
        if people && people.is_a?(Numeric)
          return price * (people * @markups.fetch(:person, 0))
        else
          return price * @markups.fetch(markup, 0)
        end
      else
       return 0
      end
    end

    def estimate(project)
      [
        flat = project.cost + cost(project.cost, :flat),
        cost(flat, :person, project.people),
        cost(flat, project.type)
      ].reduce(:+).round(2)
    end
  end
end
