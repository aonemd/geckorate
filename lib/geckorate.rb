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

      def decorate_kaminari_collection(collection)
        {
          page: collection.current_page,
          per_page: collection.default_per_page,
          total: collection.total_count,
          records: decorate_collection(collection)
        }
      end
    end
  end
end
