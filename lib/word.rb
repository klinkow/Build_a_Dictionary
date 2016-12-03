class Word
  @@words = []
  attr_reader(:word, :definitions)


  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @definitions = []
    @id = @@words.length() + 1
  end

  define_method(:word) do
    @word
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

  define_singleton_method(:find) do |id_number|
    found_word = nil
    @@words.each do |the_word|
      if the_word.id().eql?(id_number)
        found_word = the_word
      end
    end
    found_word
  end
end
