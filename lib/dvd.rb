class Dvd < Midia

  attr_accessor :value
  attr_reader :title

  def initialize(title, value, category)
    @title = title
    @value = value
    @category = category
  end

  def to_s
    %Q{ Título: #{@title}, Valor: #{@value} }
  end
end
