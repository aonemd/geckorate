require "geckorate/version"

module Geckorate
  class Decorator < SimpleDelegator
    def decorate; end

    class << self
      def decorate_collection(collection)
        collection.map do |item|
          klass           = item.class
          full_klass_name = klass.to_s.concat('Decorator')
          decorator_klass = Class.const_get(full_klass_name)
          decorator_klass.new(item).decorate
        end
      end
    end
  end
end
