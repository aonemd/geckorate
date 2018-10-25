require "geckorate/version"

module Geckorate
  class Decorator < SimpleDelegator
    def decorate; end

    class << self
      def decorate_collection(collection, class_name = nil)
        return [] if collection.empty?

        klass           = class_name || collection.first.class
        full_klass_name = klass.to_s.concat('Decorator')
        decorator_klass = Class.const_get(full_klass_name)

        collection.map do |item|
          decorator_klass.new(item).decorate
        end
      end

      def decorate_kaminari_collection(collection, class_name = nil)
        {
          page: collection.current_page,
          per_page: collection.current_per_page,
          total: collection.total_count,
          records: decorate_collection(collection, class_name)
        }
      end

      def decorate_will_paginate_collection(collection, class_name = nil)
        {
          page: collection.current_page,
          per_page: collection.per_page,
          total: collection.total_entries,
          records: decorate_collection(collection, class_name)
        }
      end
    end
  end
end
