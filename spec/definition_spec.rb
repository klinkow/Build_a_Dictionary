require('rspec')
require('definition')
describe('Definition') do

  before() do
    Definition.clear()
    @test_definition1 = Definition.new(:definition => "A delicious red fruit")
    @test_definition1.save()
    @test_definition2 = Definition.new(:definition => "A delicious yellow fruit")
    @test_definition2.save()
  end

  describe("#definition") do
    it("returns the first definition") do
      expect(@test_definition1.definition()).to(eq("A delicious red fruit"))
    end
  end

  describe(".all") do
    it("returns all definitions that have been saved in an array") do
      expect(Definition.all()).to(eq([@test_definition1, @test_definition2]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved definitions") do
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the definition") do
      expect(@test_definition1.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns a definition by its id number") do
      expect(Definition.find(@test_definition1.id())).to(eq(@test_definition1))
    end
  end
end
