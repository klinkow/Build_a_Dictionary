class Definition
  attr_reader(:definition1, :definition2, :definition3, :definition4, :definition5)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
    @id = @@definitions.length() + 1
  end

  define_method(:definition) do
    @definition
  end

  define_method(:id) do
    @id
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |id_number|
    found_definition = nil
    @@definitions.each do |the_definition|
      if the_definition.id() == id_number
        found_definition = the_definition
      end
    end
    found_definition
  end
end
