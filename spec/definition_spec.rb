require('rspec')
require('definition')
describe('Definition') do

  before() do
    Definition.clear()
    @test_definition1 = Definition.new(:definition1 => "definition 1: A delicious red fruit", :definition2 => "definition 2: A red fruit", :definition3 => "definition 3: A red object", :definition4 => "definition 4: A red thingamajig", :definition5 => "definition 5: A red tree growing thing")
    @test_definition1.save()
    @test_definition2 = Definition.new(:definition1 => "definition 1: A delicious yellow fruit", :definition2 => "definition 2: A yellow fruit", :definition3 => "definition 3: A yellow object", :definition4 => "definition 4: A yellow thingamajig", :definition5 => "definition 5: A yellow tree growing thing")
    @test_definition2.save()
  end

  describe("#definition1") do
    it("returns the first definition") do
      expect(@test_definition1.definition1()).to(eq("definition 1: A delicious red fruit"))
    end
  end

  describe("#definition2") do
    it("returns the second definition") do
      expect(@test_definition1.definition2()).to(eq("definition 2: A red fruit"))
    end
  end

  describe("#definition3") do
    it("returns the third definition") do
      expect(@test_definition1.definition3()).to(eq("definition 3: A red object"))
    end
  end

  describe("#definition4") do
    it("returns the fourth definition") do
      expect(@test_definition1.definition4()).to(eq("definition 4: A red thingamajig"))
    end
  end

  describe("#definition5") do
    it("returns the fifth definition") do
      expect(@test_definition1.definition5()).to(eq("definition 5: A red tree growing thing"))
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
