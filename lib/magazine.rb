class Magazine
  def initialize(title)
    @title = title
  end

  def title
    @title
  end

  def formated_title
    "Título: #{@title}."
  end
end
