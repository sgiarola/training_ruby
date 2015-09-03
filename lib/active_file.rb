require "fileutils"
require "yaml"

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

  class Field
    attr_reader :name, :required

    def initialize(name, required)
      @name, @required = name, required
    end

    def to_assign
      "@#{@name} = #{@name}"
    end
  end

  module ClassMethods

    attr_reader :fields

    def find(id)
      raise DocumentNotFound, "Arquivo db/magazines/#{id} não encontrado", caller unless File.exists?("db/magazines/#{id}.yml")
      YAML.load File.open("db/magazines/#{id}.yml", "r")
    end

    def next_id
      Dir.glob("db/magazines/*.yml").size + 1
    end

    def field(name, required: false)
      @fields ||= []
      @fields << Field.new(name, required)

      base.class_eval %Q$
        attr_reader :id, :destroyed, :new_record
        def initialize(#{@fields.map(&:name).join(":, ")})
          @id = self.class.next_id
          @destroyed = false
          @new_record = true
          #{@fields.map(&:to_assign).join("\n")}
        end
      $
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  private

  def serialize
    YAML.dump self
  end
end
