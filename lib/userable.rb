module Userable

  extend ActiveSupport::Concern
  #ActiveSuppoert::Concern auto extend ClassMethods
  included do
    has_one :user, as: :userable, dependent: :destroy, autosave:true
    validate :user_must_be_valid
    alias_method_chain :user, :autobuild
  end

  #user has to be built first in case it doesn’t exist
  def user_with_autobuild
    user_without_autobuild || build_user
  end

  #Fixing method_missing
  def method_missing(meth, *args, &blk)
      user.send(meth, *args, &blk)
    rescue NoMethodError
      super
  end

  #Handling attributes hash
  module ClassMethods
    def define_user_accessors
      all_attributes = User.content_columns.map(&:name)
      all_attributes << "password"
      all_attributes << "password_confirmation"
      ignored_attributes = ["created_at", "uplodated_at", "userable_id", "userable_type", "id"]
      attributes_to_delegate = all_attributes - ignored_attributes
      attributes_to_delegate.each do |attrib|
        class_eval <<-RUBY
          def #{attrib}
            user.#{attrib}
          end

          def #{attrib}=(value)
            self.user.#{attrib} = value
          end

          def #{attrib}?
            self.user.#{attrib}?
          end
        RUBY
      end
    end
  end

#add validator from User model to Tutor or Student
protected
  def user_must_be_valid
    unless user.valid?
      user.errors.each do |attr, message|
        errors.add(attr, message)
      end
    end
  end
end
