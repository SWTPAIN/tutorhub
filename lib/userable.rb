module Userable
  def self.included(base)
    base.has_one :user_properties, as: :userable, autosave: true
    base.validate :user_properties_must_be_valid
    base.alias_method_chain :user_properties, :autobuild

    base.extend ClassMethods
    base.define_user_properties_accessors
  end

  def user_properties_with_autobuild
    user_properties_without_autobuild || build_user_properties
  end

  def method_missing(meth, *args, &blk)
      user_properties.send(meth, *args, &blk)
    rescue NoMethodError
      super
  end

  module ClassMethods
    def defind_user_properties_accessors
      all_attributes = ProductProperties.content_columns.map(&:name)
      ignored_attributes = ["created_at", "uplodated_at", "userable_type"]
      attributes_to_delegate = all_attributes - ignored_attributes
      attributes_to_delegate.each do |attrib|
        class_eval <<-RUBY
          def #{attrib}
            user_properties.#{attrib}
          end

          def #{attrib}=(value)
            self.user_properties.#{attrib} = value
          end

          def #{attrib}
            self.user_properties.#{attrib}?
          end
        RUBY
      end
    end
  end


protected
  def user_properties_must_be_valid
    unless user_properties.valid?
      user_properties.errors.each do |attr, message|
        errors.add(attr, message)
      end
    end
  end
end
