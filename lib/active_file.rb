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

  module ClassMethods
    def find(id)
      raise DocumentNotFound, "Arquivo db/magazines/#{id} não encontrado", caller unless File.exists?("db/magazines/#{id}.yml")
      YAML.load File.open("db/magazines/#{id}.yml", "r")
    end

    def next_id
      Dir.glob("db/magazines/*.yml").size + 1
    end

    def field(name)
      @fields ||= []
      @fields << name

      get = %Q{
        def #{name}
          @#{name}
        end
      }

      set = %Q{
        def #{name}=(price)
          @#{name}=price
        end
      }

      self.class_eval get
      self.class_eval set
    end
  end

  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      attr_reader :id, :destroyed, :new_record
      def initialize(parameters = {})
        @id = self.class.next_id
        @destroyed = false
        @new_record = true

        parameters.each do |key, value|
          instance_variable_set "@#{key}", value
        end
      end
    end
  end

  private

  def serialize
    YAML.dump self
  end
end
