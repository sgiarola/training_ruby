class Magazine

  @id = 0

  def self.id
    @id += 1
  end

  def initialize(title)
    @id = self.class.id
    @title = title
  end

  def id
    @id
  end

  def title
    "Título: #{@titulo.upcase}"
  end
end
