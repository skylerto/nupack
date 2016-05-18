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
