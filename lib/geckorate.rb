require "geckorate/version"

module Geckorate
  class Decorator < SimpleDelegator
    def decorate(options = {}); end

    class << self
      def decorate_collection(collection, options = {})
        return [] if collection.empty?

        klass           = options.fetch(:class_name, collection.first.class)
        full_klass_name = klass.to_s.concat('Decorator')
        decorator_klass = Class.const_get(full_klass_name)

        collection.map do |item|
          decorator_klass.new(item).decorate(options)
        end
      end

      def decorate_kaminari_collection(collection, options = {})
        {
          page: collection.current_page,
          per_page: collection.current_per_page,
          total: collection.total_count,
          records: decorate_collection(collection, options)
        }
      end

      def decorate_will_paginate_collection(collectionf, options = {})
        {
          page: collection.current_page,
          per_page: collection.per_page,
          total: collection.total_entries,
          records: decorate_collection(collection, options)
        }
      end
    end
  end
end
