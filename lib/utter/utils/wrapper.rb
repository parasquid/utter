module Utter
  module Utils
    class Wrapper
      def wrap(wrapped_class, after: nil)
        wrapped_class.class_eval do
          @@after_action = after
          def self.inherited(klass)
            def klass.method_added(name)
              # prevent a SystemStackError
              return if @_not_new
              @_not_new = true

              # preserve the original method call
              original = "original #{name}"
              alias_method original, name

              # wrap the method call
              define_method(name) do |*args, &block|
                # before action

                # call the original method
                result = send original, *args, &block

                # after action
                @@after_action.call if !!@@after_action

                # return the original return value
                result
              end

              # reset the guard for the next method definition
              @_not_new = false
            end
          end
        end
      end
    end
  end
end