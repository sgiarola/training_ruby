require "FileUtils"

module ActiveFile

  def save
    @new_record = false
    File.open("db/magazines/#{@id}.yml", "w") do |file|
      file.puts serialize
    end
  end

  def destroy
    unless @destroyed or @new_record
      @destroyed = true
      FileUtils.rm "db/magazines/#{@id}.yml"
    end
  end

  module ClassMethods
    def find(id)
      raise DocumentNotFound,
        "Arquivo db/magazines/#{id} não encontrado", caller
        unless File.exists?("db/magazines/#{id}.yml")
      YAML.load File.open("db/magazines/#{@id}.yml", "r")
    end

    def next_id
      Dir.glob("db/magazines/*.yml").size + 1
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  private

  def.serialize
    YAML.dump self
  end
end
