module ActiveRecord
  module Validations
    class AssociatedAttributesValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        (value.is_a?(Array) ? value : [value]).each do |v|
          unless v.nil? || v.valid?
            v.errors.full_messages.each do |msg|
              record.errors.add(attribute, msg.downcase, options.merge(:value => value))
            end
          end
        end
      end
    end

    module ClassMethods
      def validates_associated_attributes(*attr_names)
        validates_with AssociatedAttributesValidator, _merge_attributes(attr_names)
      end
    end
  end
end
