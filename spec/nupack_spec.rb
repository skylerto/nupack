require 'nupack'

describe Nupack::Project do
  it 'should create a new Project with a cost of $1000, 1 person and type "other"' do
    project = Nupack::Project.new(1000)
    expect(project.cost).to eq(1000)
    expect(project.people).to eq(1)
    expect(project.type).to eq(:other)
  end

  it 'should create a new Project with a cost of $1000, 4 people, and type "food"' do
    project = Nupack::Project.new(1000, 4, "food")
    expect(project.cost).to eq(1000)
    expect(project.people).to eq(4)
    expect(project.type).to eq(:food)
  end
end

describe Nupack::MARKUPS do
  it 'should define all the markup types' do
    markups = {
      flat: 0.05,
      person: 0.012,
      food: 0.13,
      drugs: 0.075,
      electronics: 0.02
    }
    expect(Nupack::MARKUPS).to eq(markups)
  end

  it 'should access different markup types' do
    expect(Nupack::MARKUPS[:flat]).to eq(0.05)
    expect(Nupack::MARKUPS[:person]).to eq(0.012)
  end
end

describe Nupack::Calculator do
  it 'should create a new calculator with markups=Nupack::MARKUPS by default' do
    calc = Nupack::Calculator.new
    expect(calc.markups).to eq(Nupack::MARKUPS)
  end

  it 'should create a new calculator with the passed markup hash' do
    markups = {
      person: 0.1,
      flat: 0.5
    }
    calc = Nupack::Calculator.new(markups)
    expect(calc.markups).to eq(markups)
  end
end

describe 'Nupack::Calculator#cost' do
  before :each do
    @calc = Nupack::Calculator.new
  end

  it 'should calculate the cost given a price, and a symbol representing a markup' do
    expected = 100 * 0.05
    expect(@calc.cost(100, :flat)).to eq(expected)
  end

  it 'should give 0 if the symbol is not in the hash' do
    expected = 0
    expect(@calc.cost(100, :matz)).to eq(expected)
  end
  
  it 'should give 0 if its not given a symbol' do
    expected = 0
    expect(@calc.cost(100, "matz")).to eq(expected)
  end

  it 'should give 0 if the price is not a valid number' do
    expected = 0
    expect(@calc.cost("Yukihiro", "Matsumoto")).to eq(expected)
  end
end
