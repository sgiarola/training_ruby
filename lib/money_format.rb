require 'rubygems'
require 'brnumeros'

module MoneyFormat

  def instance_method
    "Um método de instância do Mixing sendo chamado."
  end

  module ClassMethods
    def format_money(*vars_and_methods)
      vars_and_methods.each do |name|
        define_method("#{name}_formated") do
          value = respond_to?(name) ?
                  send(name) :
                  instance_variable_get("@#{name}")
          "R$ #{value}"
        end

        define_method('#{name}_in_full') do
          value = respond_to?(name) ?
                  send(name) :
                  instance_variable_get("@#{name}")
            value.por_extenso_em_reais
        end

      end
    end
  end

  def self.included(class_that_included_module)
    class_that_included_module.extend ClassMethods
  end
end
