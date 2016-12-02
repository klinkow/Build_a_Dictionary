class Definition
  attr_reader(:definition1, :definition2, :definition3, :definition4, :definition5)
  @@definitions = []

  define_method(:initialize) do |attributes|
    @definition1 = attributes.fetch(:definition1)
    @definition2 = attributes.fetch(:definition2)
    @definition3 = attributes.fetch(:definition3)
    @definition4 = attributes.fetch(:definition4)
    @definition5 = attributes.fetch(:definition5)
    @id = @@definitions.length() + 1
  end

  define_method(:definition1) do
    @definition1
  end

  define_method(:definition2) do
    @definition2
  end

  define_method(:definition3) do
    @definition3
  end

  define_method(:definition4) do
    @definition4
  end

  define_method(:definition5) do
    @definition5
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
