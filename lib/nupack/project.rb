module Nupack

  ##
  # Project class create a new project with a given +cost+, number of +people+,
  # and +type+ of project.
  class Project
    attr_accessor :cost, :people, :type

    def initialize(cost, people=1, type="other")
      @cost = cost
      @people = people
      @type = type.to_sym
    end
  end
end
