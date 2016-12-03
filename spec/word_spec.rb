require('rspec')
require('word')

describe('Word') do

  before() do
    Word.clear()
    @test_word1 = Word.new(:word => "apple", :definitions => [])
    @test_word1.save()
    @test_word2 = Word.new(:word => "banana", :definitions => [])
    @test_word2.save()
  end

  describe("#word") do
    it("returns the word") do
      expect(@test_word1.word()).to(eq("apple"))
    end
  end

  describe(".all") do
    it("returns all words that have been saved in an array") do
      expect(Word.all()).to(eq([@test_word1, @test_word2]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved words") do
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the word") do
      expect(@test_word1.id()).to(eq(1))
    end
  end

  describe("#add_definition") do
    it("adds a definition to the word") do
      expect(@test_word1.add_definition("Hello there")).to(eq(["Hello there"]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      expect(Word.find(@test_word1.id())).to(eq(@test_word1))
    end
  end
end
